// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      code: (json['statusCode '] as num?)?.toInt(),
      message: json['message'] as String?,
      status: json['status'] as bool?,
      token: json['token'] as String?,
      userName: json['name'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'statusCode ': instance.code,
      'token': instance.token,
      'name': instance.userName,
    };
