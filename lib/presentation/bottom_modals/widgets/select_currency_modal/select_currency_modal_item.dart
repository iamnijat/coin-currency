part of bottom_modals_widgets;

class SelectCurrencyModalItem extends StatelessWidget {
  final int index;
  final CurrencySelectionModel currency;
  final VoidCallback selectCurrencyTap;
  const SelectCurrencyModalItem(
      {Key? key,
      required this.index,
      required this.selectCurrencyTap,
      required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: selectCurrencyTap,
        child: Padding(
          padding: index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
          child: AnimatedContainer(
            curve: Curves.easeInCubic,
            duration: const Duration(milliseconds: 320),
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                color: currency.isSelected
                    ? AppPalette.mainBlueColor
                    : AppPalette.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(getMaterialUrl(currency.code)),
                            )),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Flexible(
                        child: Text(
                          currency.name.toString(),
                          style: TextStyle(
                              color: currency.isSelected
                                  ? AppPalette.whiteColor
                                  : AppPalette.mainHeadlineBlackColor,
                              fontFamily: AppStyles.poppinsRegularFontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                          key: UniqueKey(),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: currency.isSelected,
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppPalette.whiteColor,
                    size: 7.w,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
