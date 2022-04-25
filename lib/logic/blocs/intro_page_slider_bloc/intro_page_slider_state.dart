part of 'intro_page_slider_bloc.dart';

@immutable
abstract class IntroPageSliderState {}

class IntroPageSliderInitial extends IntroPageSliderState {}

class IntroPageSliderLoading extends IntroPageSliderState {}

class IntroPageSliderLoaded extends IntroPageSliderState {
  final List<IntroPageSliderModel>? sliderList;

  IntroPageSliderLoaded(
    this.sliderList,
  );
}
