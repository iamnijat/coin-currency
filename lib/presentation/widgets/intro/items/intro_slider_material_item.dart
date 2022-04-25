part of widgets;

class IntroSliderMaterialItem extends StatelessWidget {
  final String imgUrl;
  const IntroSliderMaterialItem({Key? key, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      constraints: BoxConstraints(maxHeight: 45.h),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: svg_provider.Svg(imgUrl),
        fit: BoxFit.fitWidth,
      )),
    );
  }
}
