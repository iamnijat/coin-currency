part of widgets;

class IntroSliderDots extends StatelessWidget {
  final int currentPage;
  final int sliderListLength;

  const IntroSliderDots({
    Key? key,
    required this.currentPage,
    required this.sliderListLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.h,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: sliderListLength,
          itemBuilder: (context, index) {
            final bool isActive = index == currentPage;
            return buildDotItem(index, isActive);
          }),
    );
  }

  Padding buildDotItem(int index, bool isActive) {
    return Padding(
      padding: index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: 1.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 7),
        height: 1.h,
        width: isActive ? 7.w : 3.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isActive ? AppPalette.mainBlueColor : AppPalette.mainGreyColor,
        ),
      ),
    );
  }
}
