part of pages;

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashPageBloc()..add(SplashPageLoadEvent(context)),
      child: const _SplashPageBody(),
    );
  }
}

class _SplashPageBody extends StatelessWidget {
  const _SplashPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashPageBloc, SplashPageState>(
        builder: (context, state) {
      if (state is SplashPageLoaded) {
        return const LoadingIndicator();
      }

      return const SizedBox.shrink();
    });
  }
}
