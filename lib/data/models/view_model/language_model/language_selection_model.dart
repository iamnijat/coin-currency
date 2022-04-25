class LanguageSelectionModel {
  final String name;
  final String imgUrl;
  final String languageCode;
  bool isSelected;

  LanguageSelectionModel({
    required this.name,
    required this.imgUrl,
    required this.languageCode,
    this.isSelected = false,
  });
}
