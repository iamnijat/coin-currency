part of widgets;

class CalculatorExchangeButton extends StatelessWidget {
  final CurrencyBloc currencyBloc;
  const CalculatorExchangeButton({
    Key? key,
    required this.currencyBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: currencyBloc.exchangeCurrencyConversions,
      child: Container(
        width: 6.w,
        height: 6.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppImages.swapIcon),
        )),
      ),
    );
  }
}
