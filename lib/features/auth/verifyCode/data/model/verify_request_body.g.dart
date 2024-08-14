// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRequestBody _$VerifyRequestBodyFromJson(Map<String, dynamic> json) =>
    VerifyRequestBody(
      email: json['email'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$VerifyRequestBodyToJson(VerifyRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
