part of 'splash_page_bloc.dart';

@immutable
abstract class SplashPageEvent {}

class SplashPageLoadEvent extends SplashPageEvent {
  final BuildContext context;

  SplashPageLoadEvent(this.context);
}
