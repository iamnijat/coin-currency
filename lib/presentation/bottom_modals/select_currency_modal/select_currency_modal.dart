part of bottom_modals;

class SelectCurrencyModal extends StatelessWidget {
  final AppLocalizations localization;
  final CurrencyBloc currencyBloc;
  final String? selectedCurrencyName;
  final bool toConversion;
  const SelectCurrencyModal(
      {Key? key,
      required this.localization,
      required this.selectedCurrencyName,
      required this.toConversion,
      required this.currencyBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectCurrencyProvider(
          currencyBloc.currencies, selectedCurrencyName, localization),
      child: _SelectCurrencyModalBody(
          currencyBloc: currencyBloc,
          localization: localization,
          selectedCurrencyName: selectedCurrencyName,
          toConversion: toConversion),
    );
  }
}

class _SelectCurrencyModalBody extends StatelessWidget {
  final AppLocalizations localization;
  final CurrencyBloc currencyBloc;
  final String? selectedCurrencyName;
  final bool toConversion;
  const _SelectCurrencyModalBody(
      {Key? key,
      required this.localization,
      required this.selectedCurrencyName,
      required this.toConversion,
      required this.currencyBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Material(
      type: MaterialType.transparency,
      child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 3.h, bottom: 3.h, right: 4.w),
            child: RawScrollbar(
                thumbColor: AppPalette.mainBlueColor,
                thickness: 4,
                minThumbLength: 12.h,
                radius: const Radius.circular(35),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                    ),
                    child: SizedBox(
                        height: 50.h,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: Consumer<SelectCurrencyProvider>(
                            builder: (context, currency, child) =>
                                buildCurrenciesList(currency),
                          ),
                        ))))),
      ]),
    ));
  }

  ListView buildCurrenciesList(SelectCurrencyProvider currency) {
    return ListView.builder(
        itemCount: currency.currenciesList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var data = currency.currenciesList[index];
          return SelectCurrencyModalItem(
              index: index,
              selectCurrencyTap: () => currency.selectCurrencyItem(
                  index, toConversion, currencyBloc, context),
              currency: data);
        });
  }
}
