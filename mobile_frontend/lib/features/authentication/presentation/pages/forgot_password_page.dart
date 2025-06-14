import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';
import '../widgets/forgot_password_body.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: appbarWithBackButton(context, theme),
        body: ForgotPasswordBody(),
      ),
    );
  }
}
