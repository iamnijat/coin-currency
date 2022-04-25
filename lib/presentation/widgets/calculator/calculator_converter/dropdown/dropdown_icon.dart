import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/constants/assets.dart';

class DropdownIcon extends StatelessWidget {
  const DropdownIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.dropdownFullIcon);
  }
}
