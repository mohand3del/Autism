import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';
@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: 'error')
  final String? message;
  @JsonKey(name: 'statusCode')
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}