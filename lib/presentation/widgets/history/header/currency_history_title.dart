part of widgets;

class CurrencyHistoryTitle extends StatelessWidget {
  final String title;
  const CurrencyHistoryTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.mainHeadlineColorw70020spPoppins,
      textAlign: TextAlign.center,
    );
  }
}
