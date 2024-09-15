// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormResponseBody _$FormResponseBodyFromJson(Map<String, dynamic> json) =>
    FormResponseBody(
      message: json['message'] as String?,
      data: (json['data'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FormResponseBodyToJson(FormResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
