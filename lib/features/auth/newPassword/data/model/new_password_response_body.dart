import 'package:json_annotation/json_annotation.dart';

part 'new_password_response_body.g.dart';

@JsonSerializable()
class NewPasswordResponseBody {
  String?message;

  NewPasswordResponseBody({this.message});

  factory NewPasswordResponseBody.fromJson(Map<String,dynamic>json)=>_$NewPasswordResponseBodyFromJson(json);
}