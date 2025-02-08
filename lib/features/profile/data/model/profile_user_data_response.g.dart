// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUserDataResponse _$ProfileUserDataResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileUserDataResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileUserDataResponseToJson(
        ProfileUserDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'image': instance.image,
      'type': instance.type,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };
