import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:chef_app/core/widgets/custom_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //Header that contains image and welcome back text
              Stack(
                alignment: Alignment.center,
                children: [
                  const CustomImage(
                    imagePath: AppAssets.backgroundTwo,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Text(
                      AppStrings.welcomeBack.tr(context),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //! email TextFormField
                          CustomTextFormField(
                            hintText: AppStrings.email.tr(context),
                            labelText: AppStrings.email.tr(context),
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            validator: (val) {
                              if (!val!.contains('@gmail.com') || val.isEmpty) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          //! Password TextFormField
                          CustomTextFormField(
                            hintText: AppStrings.password.tr(context),
                            labelText: AppStrings.password.tr(context),
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            isPassword: BlocProvider.of<LoginCubit>(context)
                                .isPasswordVisible,
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            onSuffixPress: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginVisiblePassword();
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
                          BlocConsumer<GlobalCubit, GlobalState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Align(
                                alignment: BlocProvider.of<GlobalCubit>(context)
                                            .langCode ==
                                        "en"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    AppStrings.forgetPassword.tr(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          color: AppColors.greyColor,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(
                            height: 64.h,
                          ),
                          CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<LoginCubit>(context)
                                  .loginKey
                                  .currentState!
                                  .validate()) {
                                print("login");
                              }
                            },
                            text: AppStrings.signIn.tr(context),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.doNotHaveAnAccount.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: AppColors.greyColor,
                                      fontSize: 18,
                                    ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  AppStrings.signUp.tr(context),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
