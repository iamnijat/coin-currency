class CurrencySelectionModel {
  final int? nominal;
  final String? name;
  final double? value;
  final String? code;
  bool isSelected;
  CurrencySelectionModel(
      {this.nominal,
      this.name,
      this.value,
      this.code,
      this.isSelected = false});
}
