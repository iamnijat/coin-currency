part of pages;

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationTabController>(
      create: (context) => NavigationTabController(),
      child: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  /// all the pages must be preinitialized. No need to navigate,
  /// as we want not to rebuild bottombar
  static final _pages = HomeNavPagesDataUtility.getNavPages();

  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Consumer<NavigationTabController>(
        builder: (__, nav, _) => BlocProvider(
            create: (_) => CurrencyBloc()..add(CurrencyLoadEvent()),
            child: BlocBuilder<CurrencyBloc, CurrencyState>(
                builder: (context, state) {
              final _bloc = context.read<CurrencyBloc>();
              if (state is CurrencyLoading) {
                return const LoadingIndicator();
              }
              if (state is CurrencyLoaded) {
                return _HomePageBody._pages[nav.index];
              }
              if (state is CurrencyError) {
                return ErrorPage(_bloc);
              }
              return const LoadingIndicator();
            })),
      ),

      extendBody: false,
      extendBodyBehindAppBar: true, // Needed to show content under appbar
      bottomNavigationBar: const MainNavigationBottomBar(),
    );
  }
}
