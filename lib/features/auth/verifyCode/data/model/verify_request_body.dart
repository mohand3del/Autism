
import 'package:json_annotation/json_annotation.dart';
part 'verify_request_body.g.dart';
@JsonSerializable()
class VerifyRequestBody {
  String? email;
  String? code;

  VerifyRequestBody({this.email, this.code});
  Map<String,dynamic> toJson()=>_$VerifyRequestBodyToJson(this);
}