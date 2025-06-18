import 'package:flutter/material.dart';

import '../widgets/login_body.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: null,
        body: SafeArea(child: LoginBody()),
      ),
    );
  }
}
