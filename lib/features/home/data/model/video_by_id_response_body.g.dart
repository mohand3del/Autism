// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_by_id_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoByIdResponseBody _$VideoByIdResponseBodyFromJson(
        Map<String, dynamic> json) =>
    VideoByIdResponseBody(
      fullData: FullData.fromJson(json['fullData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoByIdResponseBodyToJson(
        VideoByIdResponseBody instance) =>
    <String, dynamic>{
      'fullData': instance.fullData,
    };

FullData _$FullDataFromJson(Map<String, dynamic> json) => FullData(
      vedio: Vedio.fromJson(json['vedio'] as Map<String, dynamic>),
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullDataToJson(FullData instance) => <String, dynamic>{
      'vedio': instance.vedio,
      'channel': instance.channel,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as String,
      title: json['title'] as String,
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

Vedio _$VedioFromJson(Map<String, dynamic> json) => Vedio(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      thumbnails:
          VedioThumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      likeCount: (json['likeCount'] as num).toInt(),
      dislikeCount: (json['dislikeCount'] as num).toInt(),
      viewCount: (json['viewCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
      reactionsCount: (json['reactionsCount'] as num).toInt(),
      comments: json['comments'] as List<dynamic>,
      reactions: json['reactions'] as List<dynamic>,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VedioToJson(Vedio instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnails': instance.thumbnails,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'viewCount': instance.viewCount,
      'commentsCount': instance.commentsCount,
      'reactionsCount': instance.reactionsCount,
      'comments': instance.comments,
      'reactions': instance.reactions,
      'url': instance.url,
    };

VedioThumbnails _$VedioThumbnailsFromJson(Map<String, dynamic> json) =>
    VedioThumbnails(
      thumbnailsDefault:
          Default.fromJson(json['default'] as Map<String, dynamic>),
      medium: Default.fromJson(json['medium'] as Map<String, dynamic>),
      high: Default.fromJson(json['high'] as Map<String, dynamic>),
      standard: Default.fromJson(json['standard'] as Map<String, dynamic>),
      maxres: Default.fromJson(json['maxres'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VedioThumbnailsToJson(VedioThumbnails instance) =>
    <String, dynamic>{
      'default': instance.thumbnailsDefault,
      'medium': instance.medium,
      'high': instance.high,
      'standard': instance.standard,
      'maxres': instance.maxres,
    };
