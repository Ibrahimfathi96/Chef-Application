import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigate({
  required BuildContext context,
  required String routeName,
  dynamic arguments,
}) {
  Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );
}

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { error, success, warining }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warining:
      return AppColors.primaryColor;
  }
}
