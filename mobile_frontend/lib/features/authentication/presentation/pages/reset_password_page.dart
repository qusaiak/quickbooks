import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';
import '../widgets/reset_password_body.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage(this.email, {super.key});

  final String email;

  final TextEditingController _pinCodeController = TextEditingController();

  final FocusNode _pinCodeFocusNode = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: appbarWithBackButton(context, theme),
        body: ResetPasswordBody(
          email,
          _pinCodeController,
          _formKey,
          _pinCodeFocusNode,
          _passwordController,
          _passwordFocusNode,
          _confirmPasswordController,
          _confirmPasswordFocusNode,
        ),
      ),
    );
  }
}
