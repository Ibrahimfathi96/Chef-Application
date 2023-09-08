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

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppStrings.forgetPassword2.tr(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.h),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is SendCodeSuccess) {
                showToast(
                  message: state.successMsg,
                  state: ToastStates.success,
                );
                navigate(
                  context: context,
                  routeName: Routes.resetPassword,
                );
              }
              if (state is SendCodeInError) {
                showToast(
                  message: state.errorMsg,
                  state: ToastStates.error,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
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
                      AppStrings.sendResetLinkInfo.tr(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //text field
                    CustomTextFormField(
                      hintText: AppStrings.email.tr(context),
                      labelText: AppStrings.email.tr(context),
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .emailController,
                      validator: (val) {
                        if (val!.isEmpty || !val.contains("@gmail.com")) {
                          return AppStrings.pleaseEnterValidEmail.tr(context);
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
                                  .sendCodeKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .sendCode();
                              }
                            },
                            text: AppStrings.sendResetLink.tr(context),
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
