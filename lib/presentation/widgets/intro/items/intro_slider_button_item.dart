part of widgets;

class IntroSliderButtonItem extends StatelessWidget {
  const IntroSliderButtonItem(
      {Key? key, required this.press, required this.title})
      : super(key: key);
  final VoidCallback press;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 7.h,
      decoration: AppStyles.mainBlueColorBoxDecorationStyle,
      child: Material(
        color: AppPalette.transparentColor,
        child: InkWell(
            onTap: press,
            child: Center(
              child: Text(
                title,
                style: AppStyles.whiteColor15spw700NotoSans,
              ),
            )),
      ),
    );
  }
}
