import 'package:QuickBooks/features/authentication/presentation/widgets/intro_auth_widget.dart';
import 'package:QuickBooks/features/authentication/presentation/widgets/row_widget.dart';
import 'package:QuickBooks/features/authentication/presentation/widgets/title_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme/styles.dart';
import '../../../../core/utils/functions/validator.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/default_textformfield.dart';
import '../../../../l10n/app_localizations.dart';
import 'auth_widgets.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody(
    this.email,
    this._pinCodeController,
    this._formKey,
    this._pinCodeFocusNode,
    this._passwordController,
    this._passwordFocusNode,
    this._confirmPasswordController,
    this._confirmPasswordFocusNode, {
    super.key,
  });

  final String email;

  final TextEditingController _pinCodeController;

  final FocusNode _pinCodeFocusNode;

  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;
  final TextEditingController _confirmPasswordController;
  final FocusNode _confirmPasswordFocusNode;

  final GlobalKey<FormState> _formKey;

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
                TitleAuthWidget(AppLocalizations.of(context)!.reset_password),
                CustomPinPut(_pinCodeController, _pinCodeFocusNode),
                SizedBox(height: 20.h),
                def_TextFromField(
                  textColor: theme.onSurface,
                  labelText: AppLocalizations.of(context)!.password,
                  labelStyle: Styles.textStyle14.copyWith(
                    color: theme.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                  ),
                  key: const Key('new_password_field'),
                  cursorColor: theme.primary,
                  focusNode: _passwordFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  controller: _passwordController,
                  autValidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    FocusScope.of(
                      context,
                    ).requestFocus(_confirmPasswordFocusNode);
                  },
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: theme.onSurfaceVariant,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.visibility_outlined,
                      color: theme.onSurfaceVariant,
                      size: 26,
                    ),
                  ),
                  validator:
                      (value) => Validator.validatePassword(value, context),
                ),
                def_TextFromField(
                  textColor: theme.onSurface,
                  labelText:
                  AppLocalizations.of(context)!.hint_confirm_password,
                  labelStyle: Styles.textStyle14.copyWith(
                    color: theme.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                  ),
                  key: const Key('confirm_password_field'),
                  cursorColor: theme.primary,
                  focusNode: _confirmPasswordFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  controller: _confirmPasswordController,
                  autValidateMode: AutovalidateMode.onUserInteraction,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: theme.onSurfaceVariant,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                    },
                    icon:Icon(
                      Icons.visibility_outlined,
                      color: theme.onSurfaceVariant,
                      size: 26,
                    ),
                  ),
                  validator:
                      (value) => Validator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                    context,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.verify_account_action,
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
                  text: AppLocalizations.of(context)!.did_not_receive_code,
                  textButton: AppLocalizations.of(context)!.resend_code,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_pinCodeController.text.length == 4) {}
                  },
                ),
              ],
          ),
        ),
      ),
    );
  }
}
