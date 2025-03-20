import 'package:json_annotation/json_annotation.dart';
part 'profile_user_data.g.dart';

@JsonSerializable()
class ProfileUserData {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "gender")
    String gender;
   @JsonKey(name: "dateOfBirth",)
    String dateOfBirth;
  
    ProfileUserData({
        required this.name,
        required this.gender,
        required this.dateOfBirth,
    });

    factory ProfileUserData.fromJson(Map<String, dynamic> json) => _$ProfileUserDataFromJson(json);

    Map<String, dynamic> toJson() => _$ProfileUserDataToJson(this);
    
}
