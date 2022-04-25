part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final List<CurrencyViewModel>? currency;

  CurrencyLoaded(
    this.currency,
  );
}

class CurrencyError extends CurrencyState {}
