import 'package:chef_app/core/home/home_cubit/cubit/home_cubit.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBarComponent extends StatelessWidget {
  const GoogleNavBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: GNav(
        tabBackgroundColor: AppColors.black12,
        activeColor: AppColors.primaryColor,
        selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
        tabBorderRadius: 16,
        padding: const EdgeInsets.all(16),
        gap: 10.w,
        iconSize: 28,
        onTabChange: (value) {
          BlocProvider.of<HomeCubit>(context).changeIndex(value);
        },
        tabs: [
          GButton(
            icon: Icons.menu,
            text: AppStrings.menu.tr(context),
          ),
          GButton(
            icon: Icons.person_outline,
            text: AppStrings.profile.tr(context),
          ),
        ],
      ),
    );
  }
}
