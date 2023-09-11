import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/menu/presentation/components/image_picker_dialog.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuCubit = BlocProvider.of<MenuCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppStrings.addDishToMenu.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {
                if (state is AddMealSuccessState) {
                  showToast(
                    message: AppStrings.mealAddedSuccessfully,
                    state: ToastStates.success,
                  );
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Form(
                  key: menuCubit.addToMenuKey,
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
                            bottom: 0,
                            end: -6,
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
                      SizedBox(height: 24.h),
                      // name text field
                      CustomTextFormField(
                        hintText: AppStrings.mealName.tr(context),
                        labelText: AppStrings.mealName.tr(context),
                        controller: menuCubit.mealNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealName
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),
                      //price text field
                      CustomTextFormField(
                        hintText: AppStrings.mealPrice.tr(context),
                        labelText: AppStrings.mealPrice.tr(context),
                        controller: menuCubit.mealPriceController,
                        validator: (val) {
                          if (num.tryParse(val!) == null) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          if (val.isEmpty) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      //category  dropdown menu item
                      SizedBox(height: 24.h),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 48.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox(),
                          hint: Text(AppStrings.category.tr(context)),
                          value: menuCubit.selectedItem,
                          items: menuCubit.categoryList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (data) {
                            menuCubit.changeItem(data);
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      //desc text field
                      CustomTextFormField(
                        hintText: AppStrings.mealDesc.tr(context),
                        labelText: AppStrings.mealDesc.tr(context),
                        controller: menuCubit.mealDescController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealDesc
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      //quantity or number
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primaryColor,
                                value: 'quantity',
                                groupValue: menuCubit.groupVal,
                                onChanged: (value) {
                                  menuCubit.changeGroupVal(value);
                                },
                              ),
                              Text(
                                AppStrings.mealQuantity.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 18,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: AppColors.primaryColor,
                                value: 'number',
                                groupValue: menuCubit.groupVal,
                                onChanged: (value) {
                                  menuCubit.changeGroupVal(value);
                                },
                              ),
                              Text(
                                AppStrings.mealNumber.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 18,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // add to menu button
                      SizedBox(height: 120.h),
                      CustomButton(
                        onPressed: () {
                          if (menuCubit.addToMenuKey.currentState!.validate()) {
                            menuCubit.addMealToMenu();
                          }
                        },
                        text: AppStrings.addToMenu.tr(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
