

import 'package:json_annotation/json_annotation.dart';
part 'add_reaction_response.g.dart';
@JsonSerializable()
class AddReactionResponse {
  AddReactionResponse({

    this.message,
  });


  String? message;

  factory AddReactionResponse.fromJson(Map<String, dynamic> json) => _$AddReactionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddReactionResponseToJson(this);


}