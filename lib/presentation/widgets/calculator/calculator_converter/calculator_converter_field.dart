part of widgets;

class CalculatorConverterField extends StatelessWidget {
  final CurrencyBloc currencyBloc;
  final AppLocalizations localization;
  const CalculatorConverterField(
    this.currencyBloc, {
    required this.localization,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CalculatorFromCurrencyBox(
              currencyBloc: currencyBloc, localization: localization),
          CalculatorExchangeButton(currencyBloc: currencyBloc),
          CalculatorToCurrencyBox(
              currencyBloc: currencyBloc, localization: localization),
        ],
      ),
    );
  }
}
