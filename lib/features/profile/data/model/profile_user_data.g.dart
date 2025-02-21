// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUserData _$ProfileUserDataFromJson(Map<String, dynamic> json) =>
    ProfileUserData(
      name: json['name'] as String,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
    );

Map<String, dynamic> _$ProfileUserDataToJson(ProfileUserData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
    };
