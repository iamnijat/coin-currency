import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_currency/data/helpers/dialog_helper.dart';
import 'package:coin_currency/data/models/view_model/currency_model/currency_history_model.dart';
import '../../../data/extensions/math_extensions.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/models/view_model/currency_model/currency_view_model.dart';
import '../../../data/utils/conversion_currency_utility.dart';
import '../../../domain/repositories/server_repository.dart';
import '../../../domain/services/hive/index.dart';
part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<CurrencyLoadEvent>(_onBlocLoad);
  }

  /// Initializations of Providers and Services
  HiveService get _hiveService => GetIt.I.get<HiveService>();
  ServerRepository get _serverRepository => GetIt.I.get<ServerRepository>();

  /// Getting and Formatting Current Dates
  String get currentDate => DateFormat('dd.MM.yyyy').format(selectedDateValue);
  String get formattedDate =>
      DateFormat('MMMM dd, yyyy').format(selectedDateValue);

  final currencies = <CurrencyViewModel>[];
  final currenciesHistory = <CurrencyHistoryModel>[];
  CurrencyHistoryModel currencyHistoryItem = CurrencyHistoryModel();

  /// Value Limit For Exceeding Notify
  static const maxValueLimit = 999999;

  /// RxDart Stream Controllers
  final _fromConversionValueIndicatorController =
      BehaviorSubject<CurrencyViewModel>();
  final _toConversionValueIndicatorController =
      BehaviorSubject<CurrencyViewModel>();
  final _typedConversionValueController = BehaviorSubject<double>.seeded(0);
  final _conversionValueController = BehaviorSubject<double>.seeded(0);
  final _selectedDateController =
      BehaviorSubject<DateTime>.seeded(DateTime.now());

  /// initialize BloC. Fires on first page touch
  FutureOr<void> _onBlocLoad(CurrencyLoadEvent event, emit) async {
    _emitLoadingState(emit); // <- Loading currency page;

    _clearCurrencies();

    try {
      _checkCurrenciesHistory();

      await _checkIsCurrencyCached();

      _checkEmittingState(currencies, emit);
    } on Exception catch (e) {
      emit(CurrencyError());
      Fimber.e('Exception during currency details fetching 😥', ex: e);
    }
  }

  void _checkCurrenciesHistory() {
    if (_hiveService.checkHistoryIsNotEmpty()) {
      final cachedCurrenciesData = _hiveService.fetchCurrenciesHistoryWithKey();
      cachedCurrenciesData.forEach(currenciesHistory.add);
    }
  }

  Future<void> _checkIsCurrencyCached() async {
    if (_hiveService.checkDateIsCached(currentDate)) {
      final cachedCurrenciesData =
          _hiveService.fetchCachedCurrenciesWithDate(currentDate);

      cachedCurrenciesData.forEach(currencies.add);
    } else {
      final response = await _serverRepository.getCurrencies(currentDate);
      await _hiveService.storeCachedCurrenciesWithDate(currentDate, response);
      currencies.addAll(response);
    }

    _addDefualtValuesToControllers();
  }

  void refreshFromConversionValueWithIndex(int value) {
    _fromConversionValueIndicatorController.add(currencies.elementAt(value));
    autoRefreshConversionRate();
  }

  void refreshToConversionValueWithIndex(int value) {
    _toConversionValueIndicatorController.add(currencies.elementAt(value));
    autoRefreshConversionRate();
  }

  void insertToTypedValueRate(
      int value, BuildContext context, AppLocalizations localization) {
    if (typedConversionValue < maxValueLimit) {
      _typedConversionValueController.add((typedConversionValue * 10) + value);
      autoRefreshConversionRate();
    } else {
      showExceedInputLimitInfoDialog(
          context: context, localization: localization);
    }
  }

  void deleteDigitOneByOneFromTypedValue() {
    if (typedConversionValue > 1) {
      _typedConversionValueController
          .add(typedConversionValue.makeLastDigitDroppped);
    } else {
      _typedConversionValueController.add(0);
    }
    autoRefreshConversionRate();
  }

  void deleteAllDigitsFromTypedValue() {
    _typedConversionValueController.add(0);
    autoRefreshConversionRate();
  }

  void autoRefreshConversionRate() async {
    _conversionValueController.add(
        ConversionCurrencyUtility.calculateConversionValue(
            typedConversionValue, toConversionValue, fromConversionValue));
    if (typedConversionValue != 0) {
      _populateConversionsToHistory(typedConversionValue, conversionValue,
          fromConversionValue.code, toConversionValue.code, currentDate);
      await _storeCurrenciesToHistory();
    }
  }

  Future<void> _storeCurrenciesToHistory() async {
    currenciesHistory.add(currencyHistoryItem);
    if (currenciesHistory.length > 30) {
      currenciesHistory.removeAt(29);
    }
    await _hiveService.storeCurrenciesToHistoryWithKey(currenciesHistory);
  }

  void _populateConversionsToHistory(
    fromCurrencyValue,
    toCurrencyValue,
    toCurrencyCode,
    fromCurrencyCode,
    date,
  ) {
    currencyHistoryItem = CurrencyHistoryModel(
      currentDate: date,
      fromCurrencyCode: fromCurrencyCode,
      fromCurrencyValue: fromCurrencyValue,
      toCurrencyCode: toCurrencyCode,
      toCurrencyValue: toCurrencyValue,
    );
  }

  void exchangeCurrencyConversions() {
    final fromCurrency = fromConversionValue;
    _fromConversionValueIndicatorController.add(toConversionValue);
    _toConversionValueIndicatorController.add(fromCurrency);

    final typedValue = typedConversionValue;

    _typedConversionValueController.add(conversionValue);
    _conversionValueController.add(typedValue);
    autoRefreshConversionRate();
  }

  void _addDefualtValuesToControllers() {
    _fromConversionValueIndicatorController.add(currencies.elementAt(0));
    _toConversionValueIndicatorController.add(currencies.elementAt(1));
    _typedConversionValueController.add(1);
    _conversionValueController
        .add(currencies.elementAt(1).value! * typedConversionValue);
  }

  void _emitLoadingState(emit) {
    emit(CurrencyLoading());
  }

  void _checkEmittingState(List<CurrencyViewModel> _currencies, emit) {
    if (currencies.isEmpty) {
      emit(CurrencyError());
      Fimber.e('Cannot fetch currency details 😥');
      return;
    }
    Fimber.d('Currency details has been fetched successfully 💱');

    emit(CurrencyLoaded(
      currencies,
    ));
  }

  void _clearCurrencies() {
    currencies.clear();
  }

  @override
  Future<void> close() {
    _fromConversionValueIndicatorController.close();
    _toConversionValueIndicatorController.close();
    _typedConversionValueController.close();
    _conversionValueController.close();
    _hiveService.close();
    _selectedDateController.close();
    return super.close();
  }
}

extension CurrencyBlocSelectedDateControllerRxExtension on CurrencyBloc {
  DateTime get selectedDateValue => _selectedDateController.value;
}

extension CurrencyBlocFromConversionValueIndicatorControllerRxExtension
    on CurrencyBloc {
  Stream<CurrencyViewModel> get fromConversionStream =>
      _fromConversionValueIndicatorController.stream;
  CurrencyViewModel get fromConversionValue =>
      _fromConversionValueIndicatorController.value;
}

extension CurrencyBlocToConversionValueIndicatorControllerRxExtension
    on CurrencyBloc {
  Stream<CurrencyViewModel> get toConversionStream =>
      _toConversionValueIndicatorController.stream;
  CurrencyViewModel get toConversionValue =>
      _toConversionValueIndicatorController.value;
}

extension CurrencyBlocTypedConversionValueControllerRxExtension
    on CurrencyBloc {
  Stream<double> get typedConversionStream =>
      _typedConversionValueController.stream;
  double get typedConversionValue => _typedConversionValueController.value;
}

extension CurrencyBlocConversionValueControllerRxExtension on CurrencyBloc {
  Stream<double> get conversionStream => _conversionValueController.stream;
  double get conversionValue => _conversionValueController.value;
}
