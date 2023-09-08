import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? onSuffixPress;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.icon,
    this.onSuffixPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: IconButton(
          onPressed: onSuffixPress,
          icon: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
