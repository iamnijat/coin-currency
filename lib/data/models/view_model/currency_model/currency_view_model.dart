import 'package:hive/hive.dart';

part 'currency_view_model.g.dart';

@HiveType(typeId: 1)
class CurrencyViewModel {
  @HiveField(0)
  final int? nominal;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final double? value;
  @HiveField(3)
  final String? code;

  CurrencyViewModel({
    this.nominal,
    this.name,
    this.value,
    this.code,
  });
}
