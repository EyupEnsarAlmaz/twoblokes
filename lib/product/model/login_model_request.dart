import 'package:json_annotation/json_annotation.dart';

part 'login_model_request.g.dart';

@JsonSerializable()
final class LoginRequestModel {
  const LoginRequestModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
