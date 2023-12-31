import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  height: 116.h,
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
                  AppStrings.welcomeToChefApp.tr(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.blackColor,
                      ),
                ),
                SizedBox(
                  height: 54.h,
                ),
                Text(
                  AppStrings.pleaseChooseYourLanguage.tr(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.blackColor,
                      ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: "English",
                            onPressed: () {
                              BlocProvider.of<GlobalCubit>(context)
                                  .changeLanguage('en');
                              navigate(
                                context: context,
                                routeName: Routes.login,
                              );
                            },
                            width: 140,
                            backgroundColor: AppColors.blackColor,
                          ),
                          CustomButton(
                            text: "العربية",
                            onPressed: () {
                              BlocProvider.of<GlobalCubit>(context)
                                  .changeLanguage('ar');
                              navigate(
                                context: context,
                                routeName: Routes.login,
                              );
                            },
                            width: 140,
                            backgroundColor: AppColors.blackColor,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
