import 'package:QuickBooks/features/authentication/presentation/widgets/row_widget.dart';
import 'package:QuickBooks/features/authentication/presentation/widgets/title_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/theme/styles.dart';
import '../../../../core/utils/functions/validator.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/default_textformfield.dart';
import '../../../../l10n/app_localizations.dart';
import 'intro_auth_widget.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _lastNameFocusNode = FocusNode();
  final TextEditingController _gsmController = TextEditingController();
  final FocusNode _gsmFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
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
                TitleAuthWidget(AppLocalizations.of(context)!.create_account),
                def_TextFromField(
                  textColor: theme.onSurface,
                  labelText: AppLocalizations.of(context)!.txt_first_name,
                  labelStyle: Styles.textStyle14.copyWith(
                      color: theme.onSurfaceVariant,
                      fontWeight: FontWeight.w400),
                  hintStyle: Styles.textStyle12.copyWith(
                      color: theme.onSurfaceVariant,
                      fontWeight: FontWeight.w400),
                  cursorColor: theme.primary,
                  autValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: _firstNameController,
                  focusNode: _firstNameFocusNode,
                  maxLines: 1,
                  prefixIcon: Icon(Icons.person_outline,
                      color: theme.onSurfaceVariant, size: 26),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_lastNameFocusNode);
                  },
                  maxLength: 10,
                  validator: (value) => Validator.validateEmpty(value, context),
                ),
                SizedBox(height: 20.h),
                def_TextFromField(
                  textColor: theme.onSurface,
                  labelText: AppLocalizations.of(context)!.txt_last_name,
                  labelStyle: Styles.textStyle14.copyWith(
                      color: theme.onSurfaceVariant,
                      fontWeight: FontWeight.w400),
                  hintStyle: Styles.textStyle12.copyWith(
                      color: theme.onSurfaceVariant,
                      fontWeight: FontWeight.w400),
                  cursorColor: theme.primary,
                  autValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: _lastNameController,
                  focusNode: _lastNameFocusNode,
                  maxLines: 1,
                  prefixIcon: Icon(Icons.person_outline,
                      color: theme.onSurfaceVariant, size: 26),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_gsmFocusNode);
                  },
                  maxLength: 10,
                  validator: (value) => Validator.validateEmpty(value, context),
                ),
                SizedBox(height: 20.h),
                def_TextFromField(
                  textColor: theme.onSurface,
                  labelText: AppLocalizations.of(context)!.mobile_number,
                  labelStyle: Styles.textStyle14.copyWith(
                      color: theme.onSurfaceVariant,
                      fontWeight: FontWeight.w400),
                  hintText: "09xx xxx-xxx",
                  hintStyle: Styles.textStyle12.copyWith(
                      color: theme.onSurfaceVariant,
                      fontWeight: FontWeight.w400),
                  key: const Key('gsm_field'),
                  cursorColor: theme.primary,
                  autValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  controller: _gsmController,
                  focusNode: _gsmFocusNode,
                  maxLines: 1,
                  prefixIcon: Icon(Icons.phone_outlined,
                      color: theme.onSurfaceVariant, size: 26),
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
                          fontWeight: FontWeight.w400),
                      key: const Key('new_password_field'),
                      cursorColor: theme.primary,
                      focusNode: _passwordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      controller: _passwordController,
                      autValidateMode: AutovalidateMode.onUserInteraction,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocusNode);
                      },
                      prefixIcon: Icon(Icons.lock_outline,
                          color: theme.onSurfaceVariant),
                      suffixIcon: IconButton(
                        onPressed: () {
                        },
                        icon: Icon(Icons.visibility_outlined,
                                color: theme.onSurfaceVariant, size: 26),
                      ),
                      validator: (value) =>
                          Validator.validatePassword(value, context),

                ),
                SizedBox(height: 20.h),
                 def_TextFromField(
                      textColor: theme.onSurface,
                      labelText:
                          AppLocalizations.of(context)!.hint_confirm_password,
                      labelStyle: Styles.textStyle14.copyWith(
                          color: theme.onSurfaceVariant,
                          fontWeight: FontWeight.w400),
                      key: const Key('confirm_password_field'),
                      cursorColor: theme.primary,
                      focusNode: _confirmPasswordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      controller: _confirmPasswordController,
                      autValidateMode: AutovalidateMode.onUserInteraction,
                      prefixIcon: Icon(Icons.lock_outline,
                          color: theme.onSurfaceVariant),
                      suffixIcon: IconButton(
                        onPressed: () {
                        },
                        icon:  Icon(Icons.visibility_outlined,
                                color: theme.onSurfaceVariant, size: 26),
                      ),
                      validator: (value) => Validator.validateConfirmPassword(
                          value, _passwordController.text, context),

                ),
                SizedBox(height: 10.h),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.register,
                  height: 40.h,
                  buttonTextStyle: Styles.textStyle16.copyWith(
                      color: theme.onPrimary,
                      fontWeight: FontWeight.w400),
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
                    }
                  },
                ),
                RowWidget(
                  text: AppLocalizations.of(context)!.already_a_user,
                  textButton: AppLocalizations.of(context)!.login,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    GoRouter.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
