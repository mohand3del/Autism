
import 'package:json_annotation/json_annotation.dart';

part 'forget_response_body.g.dart';
@JsonSerializable()
class ForgetResponseBody {
  String? message;


  ForgetResponseBody({this.message});

  factory ForgetResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ForgetResponseBodyFromJson(json);

}