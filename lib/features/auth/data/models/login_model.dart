import 'package:chef_app/core/database/api/end_points.dart';

class LoginMd {
  final String message;
  final String token;

  LoginMd({
    required this.message,
    required this.token,
  });
  factory LoginMd.fromJson(Map<String, dynamic> jsonData) {
    return LoginMd(
      message: jsonData[ApiKeys.message],
      token: jsonData[ApiKeys.token],
    );
  }
}
