
import 'package:online_exam/domain/model/User.dart';

class AuthResponse {
  String? message;
  String? token;
  User? user;

  AuthResponse({this.message, this.token, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json['message'] as String?,
    token: json['token'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'token': token,
    'user': user?.toJson(),
  };
}
