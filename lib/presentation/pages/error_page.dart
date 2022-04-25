part of pages;

class ErrorPage extends StatelessWidget {
  final CurrencyBloc currencyBloc;
  const ErrorPage(this.currencyBloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInUp(
              child: Center(
                child: Container(
                  width: 70.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: svg_provider.Svg(AppImages.errorIcon),
                    fit: BoxFit.fitWidth,
                  )),
                ),
              ),
            ),
            Text(
              localization.errorPageTitle,
              style: AppStyles.mainHeadlineColorw70020spPoppins,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                localization.errorPageDesc,
                style: AppStyles.mainGrayColorw70013spPoppinsLineHeight,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: double.infinity,
              height: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: AppStyles
                  .mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle,
              child: Material(
                color: AppPalette.transparentColor,
                child: InkWell(
                    onTap: _retryTap,
                    child: Center(
                      child: Text(
                        localization.errorPageRetryButtonText,
                        textAlign: TextAlign.center,
                        style: AppStyles.whiteColor15spw700NotoSans,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _retryTap() {
    currencyBloc.add(CurrencyLoadEvent());
  }
}
