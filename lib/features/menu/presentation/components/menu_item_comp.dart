import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_cached_network_image.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuItem extends StatelessWidget {
  final MealModel mealModel;
  const CustomMenuItem({
    super.key,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Row(
          children: [
            SizedBox(
              width: 60.w,
              height: 60.h,
              child: CustomCachedNetworkImage(
                imageUrl: mealModel.images[0],
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    mealModel.name,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    mealModel.description,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "${mealModel.price.toString()} LE",
                  ),
                ],
              ),
            ),
            const Spacer(),
            BlocBuilder<MenuCubit, MenuState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    awesomeAlertDialog(
                      context: context,
                      onConfirmClick: () {
                        BlocProvider.of<MenuCubit>(context)
                            .deleteMealFromMenu(mealModel.id);
                      },
                    );
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => CustomAlertDialog(
                    //     contentMsg: AppStrings.deleteMeal.tr(context),
                    //     onConfirmClick: () {},
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 46,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
