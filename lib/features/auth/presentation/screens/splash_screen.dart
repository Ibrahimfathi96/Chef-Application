import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              width: 120.w,
              child: Image.asset(
                AppAssets.appLogo,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Chef APP",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
