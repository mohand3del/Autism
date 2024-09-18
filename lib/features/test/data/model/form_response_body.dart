
import 'package:json_annotation/json_annotation.dart';
part 'form_response_body.g.dart';
@JsonSerializable()
class FormResponseBody {
  String? message;
  int? data;

  FormResponseBody({
    this.message,
    this.data,
  });

  factory FormResponseBody.fromJson(Map<String, dynamic> json) => _$FormResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$FormResponseBodyToJson(this);


}