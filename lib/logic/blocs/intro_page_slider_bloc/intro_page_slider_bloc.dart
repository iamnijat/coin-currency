import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/models/view_model/intro_page_slider_model/intro_page_slider_model.dart';
import '../../../data/utils/intro_page_slider_data_utility.dart';
import '../../../domain/services/navigation/index.dart';
import '../../../domain/services/shared_preferences/index.dart';
part 'intro_page_slider_event.dart';
part 'intro_page_slider_state.dart';

class IntroPageSliderBloc
    extends Bloc<IntroPageSliderEvent, IntroPageSliderState> {
  IntroPageSliderBloc() : super(IntroPageSliderInitial()) {
    on<IntroPageSliderLoadEvent>(_onBlocLoad);
  }

  /// Initializations of Providers and Services
  SharedPreferencesService get _sharedPreferences =>
      GetIt.I.get<SharedPreferencesService>();
  NavigationService get _navigation => GetIt.I.get<NavigationService>();

  /// dynamic pages amount control
  final PageController pageController = PageController(initialPage: 0);
  final _pageIndexStream = BehaviorSubject.seeded(1);
  int currentPage = 0;

  /// translate [PageController] index into own stream
  onPageControllerChange(int _index) => _pageIndexStream.add(_index);

  final sliders = <IntroPageSliderModel>[];

  /// initialize BloC. Fires on first page touch
  void _onBlocLoad(IntroPageSliderLoadEvent event, emit) {
    emit(IntroPageSliderLoading()); // <- Loading sliders page;

    List<IntroPageSliderModel>? slidersList;

    slidersList = IntroPageSliderDataUtility.getSliderItems(event.localization);

    sliders.addAll(slidersList);

    Fimber.d('Sliders entity has been loaded successfully 🔄');
    _buildSlidePages();
    emit(IntroPageSliderLoaded(
      slidersList,
    ));
  }

  /// initialize Slide Pages. Fires on first page touch
  void _buildSlidePages() {
    _initPageController();
  }

  /// initialize pageChanged method.
  void onPageChanged(int index) {
    currentPage = index;
  }

  /// initialize page controller method.
  void _initPageController() {
    onPageControllerChange(0);
    pageController.addListener(() => onPageControllerChange(currentPage));
  }

  void openHomePage(BuildContext context) {
    _setIntroPageSeen(context);
    _navigation.openHomePage(context);
  }

  void _setIntroPageSeen(BuildContext context) {
    _sharedPreferences.setIntroPageSeen();
  }

  /// disposing dynamic amounts
  @override
  Future<void> close() {
    _pageIndexStream.close();
    pageController.dispose();
    return super.close();
  }
}

extension IntroPageSliderBlocRxExtension on IntroPageSliderBloc {
  Stream<int> get pageIndexStream => _pageIndexStream.stream;
  int get pageIndexValue => _pageIndexStream.value;
}
