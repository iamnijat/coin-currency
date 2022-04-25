part of 'splash_page_bloc.dart';

@immutable
abstract class SplashPageState {}

class SplashPageInitial extends SplashPageState {}

class SplashPageLoading extends SplashPageState {}

class SplashPageLoaded extends SplashPageState {
  final bool? splashLoaded;

  SplashPageLoaded(
    this.splashLoaded,
  );
}

class SplashPageError extends SplashPageState {}
