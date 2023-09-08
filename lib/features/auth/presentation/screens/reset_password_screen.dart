import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppStrings.createYourNewPassword.tr(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.h),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                showToast(
                  message: state.successMsg,
                  state: ToastStates.success,
                );
                navigate(
                  context: context,
                  routeName: Routes.login,
                );
              }
              if (state is ResetPasswordInError) {
                showToast(
                  message: state.errorMsg,
                  state: ToastStates.error,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context)
                    .resetPasswordKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //image
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: const CustomImage(
                        imagePath: AppAssets.lock,
                      ),
                    ),
                    //text
                    Text(
                      AppStrings.createYourNewPassword.tr(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    //text field ==> Password
                    CustomTextFormField(
                      hintText: AppStrings.newPassword.tr(context),
                      labelText: AppStrings.newPassword.tr(context),
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordController,
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isNewPasswordVisible,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordSuffixIcon,
                      onSuffixPress: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeNewPasswordSuffixIcon();
                      },
                      validator: (val) {
                        if (val!.length < 6 || val.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //textfield ==> Confirm Password
                    CustomTextFormField(
                      hintText: AppStrings.confirmPassword.tr(context),
                      labelText: AppStrings.confirmPassword.tr(context),
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordController,
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordVisible,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordSuffixIcon,
                      onSuffixPress: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeConfirmPasswordSuffixIcon();
                      },
                      validator: (val) {
                        if (val!.length < 6 || val.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (val !=
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .newPasswordController
                                .text) {
                          return AppStrings.passwordsNotMatched.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //textfield ==> Code
                    CustomTextFormField(
                      hintText: AppStrings.code.tr(context),
                      labelText: AppStrings.code.tr(context),
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .codeController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                        //here validates if the use writes a string while it should be int only
                        //this could be solved by using specific keyboard type but here's another logic for it
                        if (num.tryParse(val) == null) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //button
                    state is SendCodeLoading
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .resetPasswordKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .resetPassword();
                              }
                            },
                            text: AppStrings.resetPassword.tr(context),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
