import 'package:json_annotation/json_annotation.dart';
part 'edit_contact_info_model.g.dart';
@JsonSerializable()
class EditContactInfoModel {
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "facebookLink")
  String facebookLink;
  @JsonKey(name: "linkedinLink")
  String linkedinLink;

  EditContactInfoModel({
    required this.address,
    required this.phone,
    required this.facebookLink,
    required this.linkedinLink,
  });

  factory EditContactInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EditContactInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditContactInfoModelToJson(this);
}
