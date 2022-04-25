part of widgets;

class CurrencyHistoryItemDate extends StatelessWidget {
  final String? date;
  const CurrencyHistoryItemDate({Key? key, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
      decoration: BoxDecoration(
        color: AppPalette.mainGreenColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Text(
        date.toString(),
        textAlign: TextAlign.center,
        style: AppStyles.whiteColor10spw700NotoSans,
      )),
    );
  }
}
