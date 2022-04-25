part of widgets;

class CurrencyHistoryEmpty extends StatelessWidget {
  final AppLocalizations localization;
  const CurrencyHistoryEmpty(this.localization, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeInLeft(
            child: Container(
              width: 70.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: svg_provider.Svg(AppImages.noDataIcon),
                fit: BoxFit.fitWidth,
              )),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text(
              localization.currencyHistoryNoDataTitle,
              textAlign: TextAlign.center,
              style: AppStyles.mainHeadlineColorw70020spPoppins,
            ),
          ),
        ],
      ),
    );
  }
}
