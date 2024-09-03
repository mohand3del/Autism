// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_by_id_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelByIdResponseBody _$ChannelByIdResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ChannelByIdResponseBody(
      nextPageToken: json['nextPageToken'] as String,
      prevPageToken: json['prevPageToken'],
      fullData: FullData.fromJson(json['fullData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelByIdResponseBodyToJson(
        ChannelByIdResponseBody instance) =>
    <String, dynamic>{
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'fullData': instance.fullData,
    };

FullData _$FullDataFromJson(Map<String, dynamic> json) => FullData(
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FullDataToJson(FullData instance) => <String, dynamic>{
      'channel': instance.channel,
      'videos': instance.videos,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      customUrl: json['customUrl'] as String,
      thumbnails: ChannelThumbnails.fromJson(
          json['thumbnails'] as Map<String, dynamic>),
      subscriberCount: json['subscriberCount'] as String,
      videoCount: json['videoCount'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'customUrl': instance.customUrl,
      'thumbnails': instance.thumbnails,
      'subscriberCount': instance.subscriberCount,
      'videoCount': instance.videoCount,
      'url': instance.url,
    };

ChannelThumbnails _$ChannelThumbnailsFromJson(Map<String, dynamic> json) =>
    ChannelThumbnails(
      thumbnailsDefault:
          Default.fromJson(json['default'] as Map<String, dynamic>),
      medium: Default.fromJson(json['medium'] as Map<String, dynamic>),
      high: Default.fromJson(json['high'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelThumbnailsToJson(ChannelThumbnails instance) =>
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

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      id: json['id'] as String,
      title: json['title'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      thumbnails:
          VideoThumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      viewCount: json['viewCount'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnails': instance.thumbnails,
      'viewCount': instance.viewCount,
      'url': instance.url,
    };

VideoThumbnails _$VideoThumbnailsFromJson(Map<String, dynamic> json) =>
    VideoThumbnails(
      thumbnailsDefault:
          Default.fromJson(json['default'] as Map<String, dynamic>),
      medium: Default.fromJson(json['medium'] as Map<String, dynamic>),
      high: Default.fromJson(json['high'] as Map<String, dynamic>),
      standard: Default.fromJson(json['standard'] as Map<String, dynamic>),
      maxres: Default.fromJson(json['maxres'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoThumbnailsToJson(VideoThumbnails instance) =>
    <String, dynamic>{
      'default': instance.thumbnailsDefault,
      'medium': instance.medium,
      'high': instance.high,
      'standard': instance.standard,
      'maxres': instance.maxres,
    };
