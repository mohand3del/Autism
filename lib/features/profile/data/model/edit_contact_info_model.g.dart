// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_contact_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditContactInfoModel _$EditContactInfoModelFromJson(
        Map<String, dynamic> json) =>
    EditContactInfoModel(
      address: json['address'] as String,
      phone: json['phone'] as String,
      facebookLink: json['facebookLink'] as String,
      linkedinLink: json['linkedinLink'] as String,
    );

Map<String, dynamic> _$EditContactInfoModelToJson(
        EditContactInfoModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'phone': instance.phone,
      'facebookLink': instance.facebookLink,
      'linkedinLink': instance.linkedinLink,
    };
