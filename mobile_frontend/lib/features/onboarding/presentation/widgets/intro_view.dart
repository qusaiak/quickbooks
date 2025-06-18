import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/colors.dart';
import '../../../../config/theme/styles.dart';

class IntroView extends StatelessWidget {
  const IntroView(this.title, this.imageUrl, {super.key});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.contain),
      ),
      padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 10.w),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: Styles.textStyle14
              .copyWith(fontWeight: FontWeight.w500, color: AppColor.primaryColor),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}