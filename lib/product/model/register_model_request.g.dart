// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModelRequest _$RegisterModelRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterModelRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterModelRequestToJson(
        RegisterModelRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
