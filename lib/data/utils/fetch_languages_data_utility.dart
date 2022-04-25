import 'package:coin_currency/data/models/view_model/language_model/language_selection_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../config/constants/assets.dart';

class FetchLanguagesDataUtility {
  static List<LanguageSelectionModel> getLanguages(
      {required AppLocalizations localization, required String languageCode}) {
    return [
      LanguageSelectionModel(
        languageCode: 'en',
        name: localization.englishLanguage,
        imgUrl: AppImages.englishLanguageIcon,
        isSelected: 'en' == languageCode,
      ),
      LanguageSelectionModel(
        languageCode: 'ru',
        name: localization.russianLanguage,
        imgUrl: AppImages.russianLanguageIcon,
        isSelected: 'ru' == languageCode,
      ),
      LanguageSelectionModel(
        languageCode: 'tr',
        name: localization.turkishLanguage,
        imgUrl: AppImages.turkishLanguageIcon,
        isSelected: 'tr' == languageCode,
      ),
      LanguageSelectionModel(
        languageCode: 'az',
        name: localization.azeriLanguage,
        imgUrl: AppImages.azeriLanguageIcon,
        isSelected: 'az' == languageCode,
      ),
    ];
  }
}
