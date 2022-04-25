part of widgets;

class LanguagePageOverview extends StatelessWidget {
  final SelectLanguagePageBloc languageBloc;
  final AppLocalizations localization;
  const LanguagePageOverview(this.languageBloc, this.localization, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            itemCount: languageBloc.languages.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = languageBloc.languages[index];
              return LanguagePageItem(languageBloc, localization, data, index);
            }));
  }
}
