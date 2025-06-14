
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../config/theme/colors.dart';

Widget spinKitApp() {
  return const SpinKitFadingCircle(
    color: AppColor.primaryLight,
    size: 35,
  );
}