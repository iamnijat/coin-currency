part of widgets;

class CalculatorFromCurrencyBox extends StatelessWidget {
  final CurrencyBloc currencyBloc;
  final AppLocalizations localization;
  const CalculatorFromCurrencyBox(
      {Key? key, required this.currencyBloc, required this.localization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CurrencyViewModel>(
        stream: currencyBloc.fromConversionStream,
        initialData: currencyBloc.currencies.elementAt(0),
        builder: (context, snapshot) {
          final currency = snapshot.data;
          return InkWell(
            onTap: () => _showSelectCurrencyModal(context, currency?.code),
            child: Container(
              decoration: AppStyles.fromCurrencyBoxDecorationStyle,
              padding: EdgeInsets.all(2.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DropdownFlagIcon(currency?.code),
                    SizedBox(
                      width: 3.w,
                    ),
                    DropdownText(text: currency?.code),
                    SizedBox(
                      width: 3.w,
                    ),
                    const DropdownIcon(),
                  ]),
            ),
          );
        });
  }

  void _showSelectCurrencyModal(context, code) {
    showFromCurrencyBottomModal(
      context,
      localization,
      currencyBloc,
      code.toString(),
      toConversionBoolean: false,
    );
  }
}
