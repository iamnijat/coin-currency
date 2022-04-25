part of dialogs;

class LanguageChangeConfirmationDialog extends StatelessWidget {
  const LanguageChangeConfirmationDialog({
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
                FadeInUp(
                  child: Container(
                    width: 70.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: svg_provider.Svg(AppImages.confirmedIcon),
                      fit: BoxFit.fitWidth,
                    )),
                  ),
                ),
                Text(
                  localization.languageConfirmationDialogTitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.mainHeadlineColorw70020spPoppins,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  localization.languageConfirmationDialogDesc,
                  textAlign: TextAlign.center,
                  style: AppStyles.mainGrayColorw70013spPoppinsLineHeight,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  decoration: AppStyles
                      .mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle,
                  child: Material(
                    color: AppPalette.transparentColor,
                    child: InkWell(
                        onTap: () => _comeBack(
                              context,
                            ),
                        child: Center(
                          child: Text(
                            localization.languageConfirmationDialogButtonTitle,
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

  void _comeBack(
    context,
  ) =>
      Navigator.pop(context, true);
}
