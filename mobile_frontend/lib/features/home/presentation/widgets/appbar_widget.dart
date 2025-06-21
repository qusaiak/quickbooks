import 'package:QuickBooks/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Qusai Abo Khier",
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.w),
                Text(
                  "Swieda, SYA",
                  style: Styles.textStyle14.copyWith(
                    color: AppColor.secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(Icons.settings, size: 28),
      ],
    );
  }
}
