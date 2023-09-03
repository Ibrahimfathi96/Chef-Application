import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //background Image
          const CustomImage(
            imagePath: AppAssets.background,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 140.h,
              ),
              CustomImage(
                imagePath: AppAssets.appLogo,
                width: 120.w,
                height: 120.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Welcome to Chef APP",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              SizedBox(
                height: 54.h,
              ),
              Text(
                "Please Choose your language",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              SizedBox(
                height: 120.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "English",
                      onPressed: () {},
                      width: 140,
                      backgroundColor: AppColors.blackColor,
                    ),
                    CustomButton(
                      text: "العربية",
                      onPressed: () {},
                      width: 140,
                      backgroundColor: AppColors.blackColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
