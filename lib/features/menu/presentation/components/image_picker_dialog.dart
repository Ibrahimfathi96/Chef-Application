import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ImagePickerDialog extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  const ImagePickerDialog({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: onCameraTap,
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.primaryColor,
            ),
            title: Text(
              AppStrings.camera.tr(context),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          ),
          ListTile(
            onTap: onGalleryTap,
            leading: const Icon(
              Icons.photo,
              color: AppColors.primaryColor,
            ),
            title: Text(
              AppStrings.gallery.tr(context),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
