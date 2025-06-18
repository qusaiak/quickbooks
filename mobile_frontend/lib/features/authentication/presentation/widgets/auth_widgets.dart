import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/theme/app_decoration.dart';
import '../../../../config/theme/styles.dart';
import '../../../../core/utils/functions/validator.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut(
    this._pinCodeController,
    this._pinCodeFocusNode, {
    super.key,
  });

  final TextEditingController _pinCodeController;

  final FocusNode _pinCodeFocusNode;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (val) {
        _pinCodeFocusNode.unfocus();
      },
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      length: 4,
      validator: (value) => Validator.validateEmpty(value, context),
      focusNode: _pinCodeFocusNode,
      showCursor: true,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      controller: _pinCodeController,
      closeKeyboardWhenCompleted: true,
      defaultPinTheme: AppDecoration.defaultPinTheme,
      focusedPinTheme: AppDecoration.focusedPinTheme,
      submittedPinTheme: AppDecoration.submittedPinTheme,
    );
  }
}

AppBar appbarWithBackButton(context, theme) {
  return AppBar(
    elevation: 0,
    shadowColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios, size: 20, color: theme.onSurface),
    ),
  );
}

Widget radioListTitle(theme, context, value, selectedValue, title) {
  return Row(
    children: [
      Radio(
        value: value,
        groupValue: selectedValue,
        onChanged: (val) {},
        activeColor: theme.primary,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return theme.primary;
          }
          return Colors.grey;
        }),
      ),
      Text(title, style: Styles.textStyle14.copyWith(color: theme.onSurface)),
    ],
  );
}
