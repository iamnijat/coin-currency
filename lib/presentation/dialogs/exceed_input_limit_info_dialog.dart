part of dialogs;

class ExceedInputLimitInfoDialog extends StatelessWidget {
  const ExceedInputLimitInfoDialog({
    required this.localization,
    Key? key,
  }) : super(key: key);
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppPalette.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                FadeInDown(
                  child: Container(
                    width: 70.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: svg_provider.Svg(AppImages.notifyIcon),
                      fit: BoxFit.fitWidth,
                    )),
                  ),
                ),
                Text(
                  localization.exceedInputLimitInfoTitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.mainHeadlineColorw70017spPoppins,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  decoration: AppStyles
                      .mainBlueColorExceedInputDialogButtonBoxDecorationStyle,
                  child: Material(
                    color: AppPalette.transparentColor,
                    child: InkWell(
                        onTap: () => _comeBack(context),
                        child: Center(
                          child: Text(
                            localization.exceedInputLimitInfoButtonTitle,
                            textAlign: TextAlign.center,
                            style: AppStyles.whiteColor15spw700NotoSans,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _comeBack(context) => Navigator.pop(context, true);
}
