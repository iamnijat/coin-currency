import 'package:hive/hive.dart';

part 'currency_history_model.g.dart';

@HiveType(typeId: 2)
class CurrencyHistoryModel {
  @HiveField(0)
  final String? fromCurrencyCode;
  @HiveField(1)
  final String? toCurrencyCode;
  @HiveField(2)
  final double? fromCurrencyValue;
  @HiveField(3)
  final double? toCurrencyValue;
  @HiveField(4)
  final String? currentDate;

  CurrencyHistoryModel({
    this.fromCurrencyCode,
    this.toCurrencyCode,
    this.fromCurrencyValue,
    this.toCurrencyValue,
    this.currentDate,
  });
}
