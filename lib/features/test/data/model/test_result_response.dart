

import 'package:json_annotation/json_annotation.dart';

part 'test_result_response.g.dart';

@JsonSerializable()
class TestResultResponse {
  String? message;
  int? testResult;

  TestResultResponse({this.message, this.testResult});

  factory TestResultResponse.fromJson(Map<String, dynamic> json) => _$TestResultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TestResultResponseToJson(this);
}