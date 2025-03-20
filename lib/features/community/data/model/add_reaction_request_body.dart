
import 'package:json_annotation/json_annotation.dart';
part 'add_reaction_request_body.g.dart';
@JsonSerializable()
class AddReactionRequestBody {
  String? reaction;

  AddReactionRequestBody({
    this.reaction,

  });

  factory AddReactionRequestBody.fromJson(Map<String, dynamic> json) => _$AddReactionRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddReactionRequestBodyToJson(this);

}