import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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

void navigateReplacement({
  required BuildContext context,
  required String routeName,
  dynamic arguments,
}) {
  Navigator.pushReplacementNamed(
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

Future<XFile?> pickImage(ImageSource source) async {
  XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

Future uploadImages(XFile image) async {
  return MultipartFile.fromFileSync(
    image.path,
    filename: image.path.split('/').last,
  );
}

void awesomeAlertDialog({
  required BuildContext context,
  required VoidCallback onConfirmClick,
  VoidCallback? onCancelClick,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    btnOkColor: AppColors.primaryColor,
    title: AppStrings.deleteMeal.tr(context),
    desc: 'Are you sure you want to delete this meal?',
    btnCancelOnPress: () {},
    btnOkOnPress: onConfirmClick,
  ).show();
}
