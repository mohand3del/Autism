// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutModel _$AboutModelFromJson(Map<String, dynamic> json) => AboutModel(
      aboutApp: json['aboutApp'] as String,
      teamName: json['teamName'] as String,
      teamMembers: (json['teamMembers'] as List<dynamic>)
          .map((e) => TeamMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AboutModelToJson(AboutModel instance) =>
    <String, dynamic>{
      'aboutApp': instance.aboutApp,
      'teamName': instance.teamName,
      'teamMembers': instance.teamMembers,
    };

TeamMember _$TeamMemberFromJson(Map<String, dynamic> json) => TeamMember(
      name: json['name'] as String,
      role: json['role'] as String,
      link: json['link'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TeamMemberToJson(TeamMember instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'link': instance.link,
      'image': instance.image,
    };
