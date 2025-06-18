
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/styles.dart';

class RowDetailsWidget extends StatelessWidget {
  const RowDetailsWidget(this.title,this.widget,{super.key});

  final String title;

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.textStyle14
                .copyWith(color: theme.onSurface, fontWeight: FontWeight.bold),
          ),
          widget,
        ],
      ),
    );
  }
}
