

import 'package:json_annotation/json_annotation.dart';
part 'tell_about_request_body.g.dart';
@JsonSerializable()
class TellAboutRequestBody {
  String? name;
 String? autismRelation;
 String? gender;
  String? age;
  String? location;
  String? methods;

  TellAboutRequestBody({
    this.name,
    this.autismRelation,
    this.gender,
    this.age,
    this.location,
    this.methods,
  });


  Map<String, dynamic> toJson() => _$TellAboutRequestBodyToJson(this);



}