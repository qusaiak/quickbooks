import 'package:QuickBooks/features/authentication/presentation/widgets/title_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes/app_router.dart';
import '../../../../config/theme/styles.dart';
import '../../../../core/utils/functions/validator.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/default_textformfield.dart';
import '../../../../l10n/app_localizations.dart';
import 'intro_auth_widget.dart';

class ForgotPasswordBody extends StatelessWidget {
  ForgotPasswordBody({super.key});

  final TextEditingController _gsmController = TextEditingController();
  final FocusNode _gsmFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IntroAuthWidget(),
              TitleAuthWidget(AppLocalizations.of(context)!.mobile_number),
              def_TextFromField(
                textColor: theme.onSurface,
                labelText: AppLocalizations.of(context)!.mobile_number,
                hintText: "09xx xxx-xxx",
                hintStyle: Styles.textStyle12.copyWith(
                  color: theme.onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: Styles.textStyle14.copyWith(
                  color: theme.onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                ),
                key: const Key('gsm_field'),
                cursorColor: theme.primary,
                autValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                controller: _gsmController,
                focusNode: _gsmFocusNode,
                maxLines: 1,
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: theme.onSurfaceVariant,
                  size: 26,
                ),
                maxLength: 10,
                validator: (value) => Validator.validateGsm(value, context),
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.btn_continue,
                height: 40.h,
                buttonTextStyle: Styles.textStyle16.copyWith(
                  color: theme.onPrimary,
                  fontWeight: FontWeight.w400,
                ),
                margin: EdgeInsets.symmetric(vertical: 10.h),
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: theme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  shadowColor: Colors.white,
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (_formKey.currentState!.validate()) {
                    GoRouter.of(context).push(
                        "${AppRouter.kLoginPage}/${AppRouter.kForgotPasswordPage}/${AppRouter.kResetPasswordPage}/${_gsmController.text}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
