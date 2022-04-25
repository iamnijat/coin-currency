part of widgets;

class CurrencyHistoryItemConversionValues extends StatelessWidget {
  final CurrencyHistoryModel currency;
  const CurrencyHistoryItemConversionValues({Key? key, required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '${currency.fromCurrencyCode ?? 0} ',
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
              TextSpan(
                  text:
                      '${(currency.fromCurrencyValue ?? 0).makeFormattedWithComma} ',
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
            ]),
          ),
        ),
        Icon(
          Icons.arrow_right_alt_rounded,
          size: 8.w,
        ),
        Flexible(
          flex: 0,
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '${currency.toCurrencyCode ?? 0} ',
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
              TextSpan(
                  text:
                      '${(currency.toCurrencyValue ?? 0).makeFormattedWithComma} ',
                  style: AppStyles.mainHeadlineColor14spw700Poppins),
            ]),
          ),
        )
      ],
    );
  }
}
