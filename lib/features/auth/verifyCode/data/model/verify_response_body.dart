
import 'package:json_annotation/json_annotation.dart';
part 'verify_response_body.g.dart';
@JsonSerializable()
class VerifyResponseBody {
  String? message;

  VerifyResponseBody({this.message});
  factory VerifyResponseBody.fromJson(Map<String,dynamic>json)=> _$VerifyResponseBodyFromJson(json);
}