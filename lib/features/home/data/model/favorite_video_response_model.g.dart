// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_video_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteVideoResponseModel _$FavoriteVideoResponseModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteVideoResponseModel(
      fullData: FullData.fromJson(json['fullData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteVideoResponseModelToJson(
        FavoriteVideoResponseModel instance) =>
    <String, dynamic>{
      'fullData': instance.fullData,
    };

FullData _$FullDataFromJson(Map<String, dynamic> json) => FullData(
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>)
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FullDataToJson(FullData instance) => <String, dynamic>{
      'videos': instance.videos,
      'channels': instance.channels,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnails: ChannelThumbnails.fromJson(
          json['thumbnails'] as Map<String, dynamic>),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnails': instance.thumbnails,
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
      url: json['url'] as String,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnails': instance.thumbnails,
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
