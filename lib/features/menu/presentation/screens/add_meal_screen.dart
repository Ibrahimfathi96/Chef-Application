import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/features/menu/presentation/components/image_picker_dialog.dart';
import 'package:flutter/material.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppStrings.addDishToMenu.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              //add photo of meal
              Stack(
                children: [
                  //image
                  const CustomImage(
                    imagePath: AppAssets.imagePicker,
                  ),
                  //add icon button
                  Positioned.directional(
                    bottom: -8,
                    end: -4,
                    textDirection: Directionality.of(context),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const ImagePickerDialog(),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 36,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              // name text field
              //price text field
              //category  dropdown menu item
              //desc text field
              //quantity or number
              // add to menu button
            ],
          ),
        ),
      ),
    );
  }
}
