part of widgets;

class LanguagePageItem extends StatelessWidget {
  final SelectLanguagePageBloc languageBloc;
  final AppLocalizations localization;
  final LanguageSelectionModel langObject;
  final int index;
  const LanguagePageItem(
      this.languageBloc, this.localization, this.langObject, this.index,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectLanguageItem(index, context),
      child: Padding(
        padding: index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
        child: AnimatedContainer(
            curve: Curves.easeInCubic,
            duration: const Duration(milliseconds: 320),
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
                border: langObject.isSelected
                    ? Border.all(
                        color: AppPalette.whiteColor,
                      )
                    : Border.all(color: AppPalette.mainBackColor, width: 1),
                color: langObject.isSelected
                    ? AppPalette.mainBlueColor
                    : AppPalette.whiteColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: <Widget>[
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: svg_provider.Svg(langObject.imgUrl),
                      )),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  langObject.name,
                  style: TextStyle(
                      color: langObject.isSelected
                          ? AppPalette.whiteColor
                          : AppPalette.mainHeadlineBlackColor,
                      fontFamily: AppStyles.poppinsRegularFontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                  key: UniqueKey(),
                ),
              ],
            )),
      ),
    );
  }

  void _selectLanguageItem(int index, BuildContext context) {
    _makeLanguageSelected(index);
    _showSuccessLanguageChangedDialog(context);
  }

  void _showSuccessLanguageChangedDialog(context) {
    showLanguageChangeConfirmationDialog(
      context: context,
      localization: localization,
    ).then((value) {
      final _provider =
          Provider.of<NavigationTabController>(context, listen: false);
      _provider.jumpToTab(0);
    });
  }

  void _makeLanguageSelected(index) {
    languageBloc
      ..selectLanguageItem(
        index,
        localization,
        languageBloc,
      )
      ..add(SelectLanguagePageLoadEvent(localization));
  }
}
