// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestResultResponse _$TestResultResponseFromJson(Map<String, dynamic> json) =>
    TestResultResponse(
      message: json['message'] as String?,
      testResult: (json['testResult'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TestResultResponseToJson(TestResultResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'testResult': instance.testResult,
    };
