part of 'intro_page_slider_bloc.dart';

@immutable
abstract class IntroPageSliderEvent {}

class IntroPageSliderLoadEvent extends IntroPageSliderEvent {
  final AppLocalizations localization;
  IntroPageSliderLoadEvent(this.localization);
}
