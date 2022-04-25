part of widgets;

class CurrencyHistoryItemValutes extends StatelessWidget {
  final String? fromCurrencyCode;
  final String? toCurrencyCode;
  const CurrencyHistoryItemValutes(
      {Key? key, required this.fromCurrencyCode, required this.toCurrencyCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: '${fromCurrencyCode ?? 0}',
                style: AppStyles.mainHeadlineColor14spw700NotoSans),
            TextSpan(
                text: ' / ', style: AppStyles.mainGrayColor14spw700NotoSans),
            TextSpan(
                text: '${toCurrencyCode ?? 0}',
                style: AppStyles.mainHeadlineColor14spw700NotoSans),
          ]),
        ),
      ],
    );
  }
}
