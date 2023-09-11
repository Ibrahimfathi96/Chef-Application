import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
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
              child: const CustomCachedNetworkImage(
                imageUrl:
                    "https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png",
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
                  const Text(
                    "Title",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const Text(
                    "SubTitle",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const Text(
                    "Price LE",
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                awesomeAlertDialog(context);
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
            ),
          ],
        ),
      ),
    );
  }
}
