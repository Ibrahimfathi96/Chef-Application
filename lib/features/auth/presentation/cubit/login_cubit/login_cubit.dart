import 'package:chef_app/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginVisiblePassword() {
    isPasswordVisible = !isPasswordVisible;
    suffixIcon = isPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginVisiblePassword());
  }
}
