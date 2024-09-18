

import 'package:json_annotation/json_annotation.dart';
part 'tell_about_response_body.g.dart';
@JsonSerializable()
class TellAboutResponseBody {
  String? message;


  TellAboutResponseBody({
    this.message,

  });

  factory TellAboutResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TellAboutResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$TellAboutResponseBodyToJson(this);
}