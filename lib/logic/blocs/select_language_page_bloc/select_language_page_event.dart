part of 'select_language_page_bloc.dart';

@immutable
abstract class SelectLanguagePageEvent {}

class SelectLanguagePageLoadEvent extends SelectLanguagePageEvent {
  final AppLocalizations localization;
  SelectLanguagePageLoadEvent(this.localization);
}

class SelectLanguagePageRefreshEvent extends SelectLanguagePageEvent {}
