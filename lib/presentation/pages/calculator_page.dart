part of pages;

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final _currencyBloc = BlocProvider.of<CurrencyBloc>(context);
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5.h,
            ),
            CalculatorTitle(title: localization.calculatorPageTitle),
            SizedBox(
              height: 3.h,
            ),
            CalculatorConverterField(
              _currencyBloc,
              localization: localization,
            ),
            SizedBox(
              height: 3.h,
            ),
            CalculatorCurrencyViewBox(
              _currencyBloc,
            ),
            const Spacer(),
            NumKeyboardWidget(_currencyBloc, localization: localization),
          ]),
    );
  }
}
