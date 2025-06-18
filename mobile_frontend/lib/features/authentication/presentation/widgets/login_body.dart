import 'package:QuickBooks/features/authentication/presentation/widgets/intro_auth_widget.dart';
import 'package:QuickBooks/features/authentication/presentation/widgets/row_widget.dart';
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

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  final TextEditingController _gsmController = TextEditingController();
  final FocusNode _gsmFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IntroAuthWidget(),
              TitleAuthWidget(AppLocalizations.of(context)!.welcome),
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
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                maxLength: 10,
                validator: (value) => Validator.validateGsm(value, context),
              ),
              SizedBox(height: 20.h),
              def_TextFromField(
                textColor: theme.onSurface,
                labelText: AppLocalizations.of(context)!.password,
                labelStyle: Styles.textStyle14.copyWith(
                  color: theme.onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                ),
                key: const Key('login_password_field'),
                cursorColor: theme.primary,
                focusNode: _passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                maxLines: 1,
                controller: _passwordController,
                autValidateMode: AutovalidateMode.onUserInteraction,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: theme.onSurfaceVariant,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_outlined,
                    color: theme.onSurfaceVariant,
                    size: 26,
                  ),
                ),
                validator:
                    (value) => Validator.validatePassword(value, context),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    GoRouter.of(context).push(
                      "${AppRouter.kLoginPage}/${AppRouter.kForgotPasswordPage}",
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forget_password,
                    style: Styles.textStyle12.copyWith(
                      color: theme.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.login,
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
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              RowWidget(
                text: AppLocalizations.of(context)!.do_not_have_an_account,
                textButton: AppLocalizations.of(context)!.register,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  GoRouter.of(context).push(AppRouter.kRegisterPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
