part of widgets;

class CurrencyHistoryItem extends StatelessWidget {
  final CurrencyHistoryModel currency;
  const CurrencyHistoryItem({Key? key, required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppPalette.whiteColor,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CurrencyHistoryItemStackedFlags(
                fromCurrencyCode: currency.fromCurrencyCode,
                toCurrencyCode: currency.toCurrencyCode,
              ),
              CurrencyHistoryItemDate(
                date: currency.currentDate,
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          CurrencyHistoryItemValutes(
              fromCurrencyCode: currency.fromCurrencyCode,
              toCurrencyCode: currency.toCurrencyCode),
          SizedBox(
            height: 2.h,
          ),
          CurrencyHistoryItemConversionValues(
            currency: currency,
          ),
        ]),
      ),
    );
  }
}
