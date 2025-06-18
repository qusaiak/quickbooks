import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';
import '../../config/theme/styles.dart';

PreferredSizeWidget customAppBar(
    String title,
    IconData? leading,
    List<Widget>? actions,
    VoidCallback? onPressedLeading,
    Color color) {
  return AppBar(
    leading: leading != null
        ? IconButton(
            onPressed: onPressedLeading,
            icon: Icon(
              leading,
              color: color,
            ),
          )
        : const SizedBox(),
    centerTitle: false,
    backgroundColor: AppColor.transparent,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    title: Text(title),
    titleTextStyle:
        Styles.textStyle18.copyWith(color: color, fontWeight: FontWeight.bold),
    actions: actions,
  );
}
