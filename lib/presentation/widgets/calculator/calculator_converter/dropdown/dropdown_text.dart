import 'package:flutter/material.dart';

import '../../../../../config/constants/styles.dart';

class DropdownText extends StatelessWidget {
  final String? text;
  const DropdownText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: Text(
        text.toString(),
        style: AppStyles.mainHeadlineColor14spw700NotoSans,
        key: UniqueKey(),
      ),
    );
  }
}
