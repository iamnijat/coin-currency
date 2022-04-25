part of pages;

class CurrencyHistoryPage extends StatelessWidget {
  const CurrencyHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final _currencyBloc = BlocProvider.of<CurrencyBloc>(context);
    return Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: _currencyBloc.currenciesHistory.isEmpty
            ? CurrencyHistoryEmpty(localization)
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 5.h,
                    ),
                    CurrencyHistoryTitle(
                        title: localization.currencyHistoryPageTitle),
                    SizedBox(
                      height: 3.h,
                    ),
                    buildItems(_currencyBloc, context, localization),
                    SizedBox(
                      height: 2.h,
                    ),
                  ]),
                ),
              ));
  }

  MediaQuery buildItems(CurrencyBloc _currencyBloc, BuildContext context,
      AppLocalizations localization) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _currencyBloc.currenciesHistory.length,
          itemBuilder: (context, index) {
            var currency = _currencyBloc.currenciesHistory[index];
            return Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                child: CurrencyHistoryItem(currency: currency));
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
            color: AppPalette.mainDividerBackColor,
          ),
        ));
  }
}
