import 'palette.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final bool deviceTablet = SizerUtil.deviceType == DeviceType.tablet;

abstract class AppStyles {
  static const poppinsRegularFontFamily = "Poppins";
  static const notoSansFontFamily = "Noto Sans";

  static final mainHeadlineColorw70020spPoppins = TextStyle(
    color: AppPalette.mainHeadlineBlackColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColorw70017spPoppins = TextStyle(
    color: AppPalette.mainHeadlineBlackColor,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainGrayColorw70013spPoppinsLineHeight = TextStyle(
    color: AppPalette.greyColor,
    fontSize: 13.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColorw70022spPoppins = TextStyle(
    color: AppPalette.mainHeadlineBlackColor,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColorw70015spPoppins = TextStyle(
    color: AppPalette.mainHeadlineBlackColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );
  static final mainHeadlineColorw50012spPoppinsLineHeight = TextStyle(
    color: AppPalette.mainHeadlineBlackColor,
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsRegularFontFamily,
  );

  static final whiteColor15spw700NotoSans = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp);

  static final whiteColor10spw700NotoSans = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 10.sp);

  static final mainHeadlineColor15spw500Poppins = TextStyle(
      color: AppPalette.mainHeadlineBlackColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 15.sp);

  static final mainHeadlineColor14spw700NotoSans = TextStyle(
      color: AppPalette.mainHeadlineBlackColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);
  static final mainHeadlineColor14spw700Poppins = TextStyle(
      color: AppPalette.mainHeadlineBlackColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final mainGrayColor14spw700NotoSans = TextStyle(
      color: AppPalette.greyColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final mainHeadlineColor14spw700NotoSansLineHeight = TextStyle(
      color: AppPalette.mainHeadlineBlackColor,
      fontFamily: notoSansFontFamily,
      height: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final greyColor11spw700Poppins = TextStyle(
      color: AppPalette.greyColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 11.sp);

  static final mainBlueColorBoxDecorationStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: AppPalette.mainBlueColor,
  );

  static final mainBlueColorExceedInputDialogButtonBoxDecorationStyle =
      BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: AppPalette.mainBlueColor,
  );

  static final mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle =
      BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppPalette.mainBlueColor,
  );

  static final fromCurrencyBoxDecorationStyle = BoxDecoration(
      color: AppPalette.whiteColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppPalette.blueGrayColor, width: 1));

  static final disabledDigitButtonBoxDecorationStyle = BoxDecoration(
      boxShadow: [mainDigitBoxShadowStyle],
      shape: BoxShape.circle,
      color: AppPalette.whiteColor);

  static const activeDigitButtonBoxDecorationStyle =
      BoxDecoration(shape: BoxShape.circle, color: AppPalette.mainBlueColor);

  static final mainDigitBoxShadowStyle = BoxShadow(
    color: AppPalette.mainBlueColor.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );
}
