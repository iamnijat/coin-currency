part of 'select_language_page_bloc.dart';

@immutable
abstract class SelectLanguagePageState {}

class SelectLanguagePageInitial extends SelectLanguagePageState {}

class SelectLanguagePageLoading extends SelectLanguagePageState {}

class SelectLanguagePageLoaded extends SelectLanguagePageState {
  final List<LanguageSelectionModel>? languages;

  SelectLanguagePageLoaded(
    this.languages,
  );
}
