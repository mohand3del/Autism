// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tell_about_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TellAboutRequestBody _$TellAboutRequestBodyFromJson(
        Map<String, dynamic> json) =>
    TellAboutRequestBody(
      name: json['name'] as String?,
      autismRelation: json['autismRelation'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      location: json['location'] as String?,
      methods: json['methods'] as String?,
    );

Map<String, dynamic> _$TellAboutRequestBodyToJson(
        TellAboutRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'autismRelation': instance.autismRelation,
      'gender': instance.gender,
      'age': instance.age,
      'location': instance.location,
      'methods': instance.methods,
    };
