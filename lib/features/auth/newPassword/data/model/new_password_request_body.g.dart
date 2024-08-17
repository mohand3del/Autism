// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPasswordRequestBody _$NewPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    NewPasswordRequestBody(
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$NewPasswordRequestBodyToJson(
        NewPasswordRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
