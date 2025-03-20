import 'package:json_annotation/json_annotation.dart';

part 'about_model.g.dart';

@JsonSerializable()
class AboutModel {
  final String aboutApp;
  final String teamName;
  final List<TeamMember> teamMembers;

  AboutModel({
    required this.aboutApp,
    required this.teamName,
    required this.teamMembers,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) =>
      _$AboutModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutModelToJson(this);
}

@JsonSerializable()
class TeamMember {
  final String name;
  final String role;
  final String link;
  final String image;

  TeamMember({
    required this.name,
    required this.role,
    required this.link,
    required this.image,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);

  Map<String, dynamic> toJson() => _$TeamMemberToJson(this);
}
