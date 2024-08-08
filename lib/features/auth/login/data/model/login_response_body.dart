
import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  bool? status;
  @JsonKey(name: 'statusCode ')
  int? code;
  String? token;
  @JsonKey(name:'name')
  String? userName;

  LoginResponse({
    this.code,
    this.message,
    this.status,
    this.token,
    this.userName,

  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

}