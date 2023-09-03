import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String text;
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.backgroundColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStatePropertyAll(
              backgroundColor ?? AppColors.primaryColor,
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
    );
  }
}
