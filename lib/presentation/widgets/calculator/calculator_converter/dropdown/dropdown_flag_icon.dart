import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/constants/assets.dart';

class DropdownFlagIcon extends StatelessWidget {
  final String? currencyCode;
  const DropdownFlagIcon(this.currencyCode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.w,
      height: 7.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(getMaterialUrl(currencyCode)),
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
