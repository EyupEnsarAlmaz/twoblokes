import 'package:json_annotation/json_annotation.dart';

part 'register_model_request.g.dart';

@JsonSerializable()
final class RegisterModelRequest {
  const RegisterModelRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
}
