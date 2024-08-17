
import 'package:json_annotation/json_annotation.dart';
part 'new_password_request_body.g.dart';
@JsonSerializable()
class NewPasswordRequestBody {
  String?email;
  String?password;
  String?confirmPassword;

  NewPasswordRequestBody({this.email, this.password, this.confirmPassword});
  Map<String,dynamic>toJson()=>_$NewPasswordRequestBodyToJson(this);

}