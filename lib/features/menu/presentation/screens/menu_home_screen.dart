import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/features/menu/presentation/components/menu_item_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              //add meal button
              CustomButton(
                onPressed: () {
                  navigate(
                    context: context,
                    routeName: Routes.addMeal,
                  );
                },
                text: AppStrings.addMeal.tr(context),
              ),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 24.h,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) => const CustomMenuItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}