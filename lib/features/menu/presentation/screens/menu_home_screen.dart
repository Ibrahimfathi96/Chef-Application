import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/features/menu/presentation/components/menu_item_comp.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);
                  return Expanded(
                    child: menuCubit.meals.isEmpty
                        ? Center(
                            child: Text(
                              "No Meals Available \ngo add your first meal",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 24.h,
                            ),
                            itemCount: menuCubit.meals.length,
                            itemBuilder: (context, index) => CustomMenuItem(
                              mealModel: menuCubit.meals[index],
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
