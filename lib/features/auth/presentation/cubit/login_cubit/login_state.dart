abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangeLoginVisiblePassword extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LoginSuccessState extends LoginState {}
