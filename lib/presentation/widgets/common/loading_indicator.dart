part of widgets;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Center(
          child: SpinKitFadingCube(
        size: 18.h,
        color: AppPalette.mainBlueColor,
      )),
    );
  }
}
