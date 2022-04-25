part of pages;

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => SelectLanguagePageBloc()
        ..add(SelectLanguagePageLoadEvent(localization)),
      child: _LanguagesPageBody(localization),
    );
  }
}

class _LanguagesPageBody extends StatelessWidget {
  final AppLocalizations localization;
  const _LanguagesPageBody(this.localization, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectLanguagePageBloc, SelectLanguagePageState>(
        builder: (context, state) {
      final _bloc = context.read<SelectLanguagePageBloc>();
      if (state is SelectLanguagePageLoaded) {
        return Scaffold(
          backgroundColor: AppPalette.whiteColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 5.h,
                    ),
                    LanguagePageTitle(
                        title: localization.currencyLanguagesPageTitle),
                    SizedBox(
                      height: 3.h,
                    ),
                    LanguagePageOverview(_bloc, localization),
                  ]),
            ),
          ),
        );
      }
      if (state is SelectLanguagePageLoading) {
        return const LoadingIndicator();
      }

      return const SizedBox.shrink();
    });
  }
}
