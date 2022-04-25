part of widgets;

class IntroSliderTitleItem extends StatelessWidget {
  final String title;
  const IntroSliderTitleItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyles.mainHeadlineColorw70020spPoppins,
      ),
    );
  }
}
