import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../config/theme/styles.dart';
import '../../../../core/utils/gen/assets.gen.dart';
import '../../../../core/widgets/custom_image_view.dart';


class IntroAuthWidget extends StatelessWidget {
  const IntroAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: Assets.images.logo.appLogo.path,
            width: 85.h,
            height: 85.h,
          ),
          // GradientText(
          //   'QuickBooks',
          //   style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
          //   colors:  [
          //     theme.primary,
          //     theme.secondary,
          //   ],
          // ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
