part of widgets;

class IntroSliderDescriptionItem extends StatelessWidget {
  final String desc;
  const IntroSliderDescriptionItem({Key? key, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        desc,
        textAlign: TextAlign.center,
        style: AppStyles.mainHeadlineColorw50012spPoppinsLineHeight,
      ),
    );
  }
}
