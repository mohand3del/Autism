import 'package:json_annotation/json_annotation.dart';

part 'form_request_body.g.dart';

@JsonSerializable()
class FormRequestBody {
  final String q1;
  final String q2;
  final String q3;
  final String q4;
  final String q5;
  final String q6;
  final String q7;
  final String q8;
  final String q9;
  final String q10;

  FormRequestBody({
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.q7,
    required this.q8,
    required this.q9,
    required this.q10,
  });

  factory FormRequestBody.fromJson(Map<String, dynamic> json) => _$FormRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$FormRequestBodyToJson(this);
}
