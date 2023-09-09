import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomGNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onTabChange;
  final List<GButton> screenTabs;
  const CustomGNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    required this.screenTabs,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabBackgroundColor: AppColors.black12,
      activeColor: AppColors.primaryColor,
      selectedIndex: selectedIndex,
      tabBorderRadius: 16,
      padding: const EdgeInsets.all(16),
      gap: 10.w,
      iconSize: 28,
      onTabChange: onTabChange,
      tabs: screenTabs,
    );
  }
}
