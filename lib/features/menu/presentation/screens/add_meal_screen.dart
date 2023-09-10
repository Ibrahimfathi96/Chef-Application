import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/features/menu/presentation/components/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
          child: Center(
            child: Column(
              children: [
                //add photo of meal
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //image
                    const CustomImage(
                      imagePath: AppAssets.imagePicker,
                    ),
                    //add icon button
                    Positioned.directional(
                      bottom: -4,
                      end: -2,
                      textDirection: Directionality.of(context),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ImagePickerDialog(
                              onCameraTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.camera);
                              },
                              onGalleryTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.gallery);
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xffFB5607),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(2),
                              bottomRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 28,
                            color: Colors.white,
                          ),
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
      ),
    );
  }
}
