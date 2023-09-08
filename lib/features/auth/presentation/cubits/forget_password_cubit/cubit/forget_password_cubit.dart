import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void sendCode() async {
    emit(SendCodeLoading());
    final result = await authRepository.sendCode(emailController.text);
    result.fold(
      (l) => emit(SendCodeInError(errorMsg: l)),
      (r) => emit(SendCodeSuccess(successMsg: r)),
    );
  }
}
