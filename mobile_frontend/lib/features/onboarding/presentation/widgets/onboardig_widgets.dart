import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/theme/colors.dart';
import '../../../../config/theme/styles.dart';
import '../../../../injection_container.dart';
import '../../../../l10n/app_localizations.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.0.h,
      right: 20.0.w,
      child: TextButton(
        onPressed: () async {
          // Routing to Login
          isOnboarding = "true";
          // await SecureStorage.writeSecureData(key: 'isOnboarding', value: true);
          GoRouter.of(context).pushReplacement(AppRouter.kLoginPage);
        },
        child: Text(
          AppLocalizations.of(context)!.skip,
          style: Styles.textStyle16.copyWith(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}