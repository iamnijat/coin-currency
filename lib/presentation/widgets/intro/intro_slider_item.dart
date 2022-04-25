part of widgets;

class IntroSliderItem extends StatelessWidget {
  final int index;
  final List<IntroPageSliderModel>? _sliderList;
  final IntroPageSliderBloc _introBloc;
  final AppLocalizations localization;

  const IntroSliderItem(
      this.index, this._sliderList, this._introBloc, this.localization,
      {Key? key})
      : super(key: key);

  List<IntroPageSliderModel>? get model => _sliderList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 4.h,
        ),
        IntroSliderMaterialItem(
          imgUrl: model![index].slideImgUrl.toString(),
        ),
        IntroSliderTitleItem(
          title: model![index].slideTitle.toString(),
        ),
        SizedBox(
          height: 2.h,
        ),
        IntroSliderDescriptionItem(
          desc: model![index].slideDescription.toString(),
        ),
        SizedBox(
          height: 2.h,
        ),
        const Spacer(),
        buildSlideDots(context),
      ],
    );
  }

  StreamBuilder buildSlideDots(BuildContext context) {
    return StreamBuilder<int>(
        stream: _introBloc.pageIndexStream,
        builder: (context, snapshot) {
          final _pageIndex = snapshot.data ?? 0;
          final _lastIndex = model!.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  opacity: _pageIndex == _lastIndex ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 750),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: IntroSliderButtonItem(
                        press: () => _introBloc.openHomePage(context),
                        title: localization.introSliderLetsStartButtonText),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                IntroSliderDots(
                    currentPage: _pageIndex, sliderListLength: model!.length),
              ],
            ),
          );
        });
  }
}
