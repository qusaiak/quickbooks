
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/styles.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({super.key, required this.iconData,  required this.title,  required this.onTab});

  final IconData iconData;
  final String title;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTab,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 23,
                  color: theme.primary,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: Styles.textStyle14.copyWith(
                      color: theme.onSurface, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
              onPressed: onTab,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: theme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
