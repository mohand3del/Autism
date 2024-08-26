// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelResponseBody _$ChannelResponseBodyFromJson(Map<String, dynamic> json) =>
    ChannelResponseBody(
      nextPageToken: json['nextPageToken'] as String,
      prevPageToken: json['prevPageToken'],
      fullData: (json['fullData'] as List<dynamic>)
          .map((e) => FullDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelResponseBodyToJson(
        ChannelResponseBody instance) =>
    <String, dynamic>{
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'fullData': instance.fullData,
    };

FullDatum _$FullDatumFromJson(Map<String, dynamic> json) => FullDatum(
      id: json['id'] as String,
      title: json['title'] as String,
      customUrl: json['customUrl'] as String,
      thumbnails:
          Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      subscriberCount: json['subscriberCount'] as String,
      videoCount: json['videoCount'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$FullDatumToJson(FullDatum instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'customUrl': instance.customUrl,
      'thumbnails': instance.thumbnails,
      'subscriberCount': instance.subscriberCount,
      'videoCount': instance.videoCount,
      'url': instance.url,
    };

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => Thumbnails(
      thumbnailsDefault:
          Default.fromJson(json['default'] as Map<String, dynamic>),
      medium: Default.fromJson(json['medium'] as Map<String, dynamic>),
      high: Default.fromJson(json['high'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
    <String, dynamic>{
      'default': instance.thumbnailsDefault,
      'medium': instance.medium,
      'high': instance.high,
    };

Default _$DefaultFromJson(Map<String, dynamic> json) => Default(
      url: json['url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$DefaultToJson(Default instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
