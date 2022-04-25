import 'package:bloc/bloc.dart';
import 'package:coin_currency/logic/providers/app_language_provider.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../data/models/view_model/language_model/language_selection_model.dart';
import '../../../data/utils/fetch_languages_data_utility.dart';
part 'select_language_page_event.dart';
part 'select_language_page_state.dart';

class SelectLanguagePageBloc
    extends Bloc<SelectLanguagePageEvent, SelectLanguagePageState> {
  SelectLanguagePageBloc() : super(SelectLanguagePageInitial()) {
    on<SelectLanguagePageLoadEvent>(_onBlocLoad);
    on<SelectLanguagePageRefreshEvent>(_onBlocRefresh);
  }

  AppLanguageProvider get _langProvider => GetIt.I.get<AppLanguageProvider>();
  final languages = <LanguageSelectionModel>[];

  /// initialize BloC. Fires on first page touch
  void _onBlocLoad(SelectLanguagePageLoadEvent event, emit) {
    emit(SelectLanguagePageLoading()); // <- Loading languages page;
    languages.clear();
    List<LanguageSelectionModel>? languagesList;

    final _languageCode = _langProvider.appLocal.languageCode;
    languagesList = FetchLanguagesDataUtility.getLanguages(
      languageCode: _languageCode,
      localization: event.localization,
    );

    languages.addAll(languagesList);

    Fimber.d('Languages entity 🚴 $languagesList');
    emit(SelectLanguagePageLoaded(
      languagesList,
    ));
  }

  void _onBlocRefresh(SelectLanguagePageRefreshEvent event, emit) {
    final languagesList = languages;

    emit(SelectLanguagePageLoaded(
      languagesList,
    ));
  }

  void selectLanguageItem(
    int index,
    AppLocalizations localization,
    SelectLanguagePageBloc bloc,
  ) {
    _makeLanguageItemSelected(index);
    changeLanguage(index, localization, bloc);
  }

  void changeLanguage(
    int index,
    AppLocalizations localization,
    SelectLanguagePageBloc bloc,
  ) async {
    final _languageCode = languages[index].languageCode;
    await _langProvider.changeLanguage(Locale(_languageCode));
  }

  void _makeLanguageItemSelected(index) {
    for (var element in languages) {
      element.isSelected = false;
    }
    languages[index].isSelected = true;
  }
}
