sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class SendCodeSuccess extends ForgetPasswordState {
  final String successMsg;

  SendCodeSuccess({required this.successMsg});
}

final class SendCodeLoading extends ForgetPasswordState {}

final class SendCodeInError extends ForgetPasswordState {
  final String errorMsg;

  SendCodeInError({required this.errorMsg});
}

final class ChangeNewPasswordSuffixIcon extends ForgetPasswordState {}
final class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState {}
