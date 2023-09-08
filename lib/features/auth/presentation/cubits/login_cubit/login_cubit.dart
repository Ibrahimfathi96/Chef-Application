import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepository authRepo;

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  IconData suffixIcon = Icons.visibility;
  LoginMd? loginMd;

  void changeLoginVisiblePassword() {
    isPasswordVisible = !isPasswordVisible;
    suffixIcon = isPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginVisiblePassword());
  }

  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    //left => String "Error", right => loginMd
    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) async {
        loginMd = r;
        await sl<CacheHelper>().saveData(
          key: ApiKeys.token,
          value: r.token,
        );
        emit(LoginSuccessState());
      },
    );
  }
}
