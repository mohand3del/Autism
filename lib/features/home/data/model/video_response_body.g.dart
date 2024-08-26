// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponseBody _$VideoResponseBodyFromJson(Map<String, dynamic> json) =>
    VideoResponseBody(
      nextPageToken: json['nextPageToken'] as String,
      prevPageToken: json['prevPageToken'],
      fullData: (json['fullData'] as List<dynamic>)
          .map((e) => FullDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResponseBodyToJson(VideoResponseBody instance) =>
    <String, dynamic>{
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'fullData': instance.fullData,
    };

FullDatum _$FullDatumFromJson(Map<String, dynamic> json) => FullDatum(
      vedio: Vedio.fromJson(json['vedio'] as Map<String, dynamic>),
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullDatumToJson(FullDatum instance) => <String, dynamic>{
      'vedio': instance.vedio,
      'channel': instance.channel,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnails:
          Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnails': instance.thumbnails,
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

Vedio _$VedioFromJson(Map<String, dynamic> json) => Vedio(
      id: Id.fromJson(json['id'] as Map<String, dynamic>),
      title: json['title'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      thumbnails:
          Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      url: json['url'] as String,
    );

Map<String, dynamic> _$VedioToJson(Vedio instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnails': instance.thumbnails,
      'url': instance.url,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      kind: $enumDecode(_$KindEnumMap, json['kind']),
      videoId: json['videoId'] as String,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'kind': _$KindEnumMap[instance.kind]!,
      'videoId': instance.videoId,
    };

const _$KindEnumMap = {
  Kind.YOUTUBE_VIDEO: 'youtube#video',
};
