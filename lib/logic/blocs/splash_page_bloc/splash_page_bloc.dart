import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../domain/services/navigation/index.dart';
import '../../../domain/services/shared_preferences/index.dart';
part 'splash_page_event.dart';
part 'splash_page_state.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  SplashPageBloc() : super(SplashPageInitial()) {
    on<SplashPageLoadEvent>(_onBlocLoad);
  }

  /// Initializations of Providers and Services
  SharedPreferencesService get _sharedPreferences =>
      GetIt.I.get<SharedPreferencesService>();
  NavigationService get _navigation => GetIt.I.get<NavigationService>();

  /// initialize BloC. Fires on first page touch
  FutureOr<void> _onBlocLoad(SplashPageLoadEvent event, emit) async {
    _emitLoadingState(emit); // <- Loading splash page;

    try {
      bool? _seen = await _sharedPreferences.getIntroPageSeen();

      if (_seen != null) {
        Timer(
            (const Duration(seconds: 3)), () => _forceHomePage(event.context));
      } else {
        Timer(
            (const Duration(seconds: 3)), () => _forceIntroPage(event.context));
      }

      _checkEmittingState(true, emit);
    } on Exception catch (e) {
      emit(SplashPageError());
      Fimber.e('Exception during splash page fetching 😥', ex: e);
    }
  }

  void _emitLoadingState(emit) {
    emit(SplashPageLoading());
  }

  void _checkEmittingState(bool? _seen, emit) {
    Fimber.d(
      'Splash page has been loaded successfully 👍',
    );
    emit(SplashPageLoaded(
      _seen,
    ));
  }

  _forceIntroPage(context) =>
      _navigation.openIntroPage(context, withReplacement: true);

  _forceHomePage(context) =>
      _navigation.openHomePage(context, withReplacement: true);
}
