// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recource_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceResponseBody _$ResourceResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ResourceResponseBody(
      fullData: (json['fullData'] as List<dynamic>)
          .map((e) => FullDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceResponseBodyToJson(
        ResourceResponseBody instance) =>
    <String, dynamic>{
      'fullData': instance.fullData,
    };

FullDatum _$FullDatumFromJson(Map<String, dynamic> json) => FullDatum(
      id: json['_id'] as String,
      pageNum: (json['pageNum'] as num).toInt(),
      title: json['title'] as String,
      snippet: json['snippet'] as String,
      link: json['link'] as String,
      favicon: json['favicon'] as String?,
      source: json['source'] as String,
      v: (json['__v'] as num).toInt(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$FullDatumToJson(FullDatum instance) => <String, dynamic>{
      '_id': instance.id,
      'pageNum': instance.pageNum,
      'title': instance.title,
      'snippet': instance.snippet,
      'link': instance.link,
      'favicon': instance.favicon,
      'source': instance.source,
      '__v': instance.v,
      'thumbnail': instance.thumbnail,
    };
