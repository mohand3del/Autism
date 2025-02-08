import 'package:json_annotation/json_annotation.dart';
part 'profile_user_data_response.g.dart';
@JsonSerializable()
class ProfileUserDataResponse {
    @JsonKey(name: "user")
    User user;

    ProfileUserDataResponse({
        required this.user,
    });

    factory ProfileUserDataResponse.fromJson(Map<String, dynamic> json) => _$ProfileUserDataResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ProfileUserDataResponseToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "gender")
    String gender;
    @JsonKey(name: "image")
    String image;
    @JsonKey(name: "type")
    String type;
    @JsonKey(name: "dateOfBirth")
    DateTime dateOfBirth;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.gender,
        required this.image,
        required this.type,
        required this.dateOfBirth,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
