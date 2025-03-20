

import 'package:json_annotation/json_annotation.dart';

part 'contact_info_model.g.dart';

@JsonSerializable()
class ContactInfoModel {
  @JsonKey(name: "user")
  User user;

  ContactInfoModel({
    required this.user,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "facebookLink")
  String facebookLink;
  @JsonKey(name: "linkedinLink")
  String linkedinLink;

  User({
    required this.id,
    required this.address,
    required this.phone,
    required this.facebookLink,
    required this.linkedinLink,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
