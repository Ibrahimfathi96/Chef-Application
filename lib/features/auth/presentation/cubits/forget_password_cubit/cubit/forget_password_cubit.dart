import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;

  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void sendCode() async {
    emit(SendCodeLoading());
    final result = await authRepository.sendCode(emailController.text);
    result.fold(
      (l) => emit(SendCodeInError(errorMsg: l)),
      (r) => emit(SendCodeSuccess(successMsg: r)),
    );
  }

  //! Reset Password logic
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();

  //* newPassword textfield
  TextEditingController newPasswordController = TextEditingController();
  bool isNewPasswordVisible = true;
  IconData newPasswordSuffixIcon = Icons.visibility;

  void changeNewPasswordSuffixIcon() {
    isNewPasswordVisible = !isNewPasswordVisible;
    newPasswordSuffixIcon =
        isNewPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //* confirmPassword textfield
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordVisible = true;
  IconData confirmPasswordSuffixIcon = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    confirmPasswordSuffixIcon =
        isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  // change password method that
  // recieves newPassword & confirmPassword &code and email
  void resetPassword() async {
    emit(ResetPasswordLoading());
    final result = await authRepository.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    result.fold(
      (l) => emit(ResetPasswordInError(errorMsg: l)),
      (r) => emit(ResetPasswordSuccess(successMsg: r)),
    );
  }
}
