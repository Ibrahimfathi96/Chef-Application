import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String contentMsg;
  final VoidCallback onConfirmClick;
  const CustomAlertDialog({
    super.key,
    required this.contentMsg,
    required this.onConfirmClick,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        contentMsg,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: AppColors.blackColor,
            ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.cancel.tr(context),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
        ),
        TextButton(
          onPressed: onConfirmClick,
          child: Text(
            AppStrings.ok.tr(context),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
        ),
      ],
    );
  }
}
