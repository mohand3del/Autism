
import 'package:json_annotation/json_annotation.dart';
part 'forget_request_body.g.dart';
@JsonSerializable()
class ForgetRequestBody {
  String? email;


  ForgetRequestBody({required this.email});

  Map<String,dynamic> toJson() => _$ForgetRequestBodyToJson(this);
}