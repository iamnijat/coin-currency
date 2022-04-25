part of pages;

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => IntroPageSliderBloc()
        ..add(
          IntroPageSliderLoadEvent(_localization),
        ),
      child: Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: _IntroPageBody(localization: _localization),
      ),
    );
  }
}

class _IntroPageBody extends StatelessWidget {
  final AppLocalizations localization;
  const _IntroPageBody({Key? key, required this.localization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroPageSliderBloc, IntroPageSliderState>(
        builder: (context, state) {
      final _bloc = context.read<IntroPageSliderBloc>();

      return PageView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: _bloc.pageController,
          onPageChanged: _bloc.onPageChanged,
          itemCount: _bloc.sliders.length,
          itemBuilder: (ctx, i) => IntroSliderItem(
                i,
                _bloc.sliders,
                _bloc,
                localization,
              ));
    });
  }
}
