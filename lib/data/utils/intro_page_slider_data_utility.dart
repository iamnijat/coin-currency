import '../../config/constants/assets.dart';
import '../models/view_model/intro_page_slider_model/intro_page_slider_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroPageSliderDataUtility {
  static List<IntroPageSliderModel> getSliderItems(
      AppLocalizations _localization) {
    return [
      IntroPageSliderModel(
        slideImgUrl: AppImages.introSliderFirstImage,
        slideTitle: _localization.introSliderFirstTitle,
        slideDescription: _localization.introSliderFirstDesc,
      ),
      IntroPageSliderModel(
        slideImgUrl: AppImages.introSliderSecondImage,
        slideTitle: _localization.introSliderSecondTitle,
        slideDescription: _localization.introSliderSecondDesc,
      ),
      IntroPageSliderModel(
        slideImgUrl: AppImages.introSliderThirdImage,
        slideTitle: _localization.introSliderThirdTitle,
        slideDescription: _localization.introSliderThirdDesc,
      ),
      IntroPageSliderModel(
        slideImgUrl: AppImages.introSliderFourthImage,
        slideTitle: _localization.introSliderFourthTitle,
        slideDescription: _localization.introSliderFourthDesc,
      ),
    ];
  }
}
