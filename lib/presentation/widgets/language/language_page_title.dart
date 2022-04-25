part of widgets;

class LanguagePageTitle extends StatelessWidget {
  final String title;
  const LanguagePageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppStyles.mainHeadlineColorw70020spPoppins,
        textAlign: TextAlign.center,
      ),
    );
  }
}
