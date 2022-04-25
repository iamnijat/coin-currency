import 'dart:async';

import 'package:bloc/bloc.dart';

part 'digit_animation_state.dart';

class DigitAnimationCubit extends Cubit<DigitAnimationState> {
  DigitAnimationCubit()
      : super(DigitAnimationState(
          tappedList: [],
        ));

  void makeClickedDigitAnimation(value) {
    state.tappedList.add(value);

    Future.delayed(const Duration(seconds: 1500)).then((_) {
      state.tappedList.clear();
    });

    emit(DigitAnimationState(
      tappedList: state.tappedList,
    ));
  }

  void state1(value, tap) {}
}
