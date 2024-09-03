
import 'package:json_annotation/json_annotation.dart';

part 'video_by_id_response_body.g.dart';



@JsonSerializable()
class VideoByIdResponseBody {
  @JsonKey(name: "fullData")
  FullData fullData;

  VideoByIdResponseBody({
    required this.fullData,
  });

  factory VideoByIdResponseBody.fromJson(Map<String, dynamic> json) => _$VideoByIdResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VideoByIdResponseBodyToJson(this);
}

@JsonSerializable()
class FullData {
  @JsonKey(name: "vedio")
  Vedio vedio;
  @JsonKey(name: "channel")
  Channel channel;

  FullData({
    required this.vedio,
    required this.channel,
  });

  factory FullData.fromJson(Map<String, dynamic> json) => _$FullDataFromJson(json);

  Map<String, dynamic> toJson() => _$FullDataToJson(this);
}

@JsonSerializable()
class Channel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "customUrl")
  String customUrl;
  @JsonKey(name: "thumbnails")
  ChannelThumbnails thumbnails;
  @JsonKey(name: "subscriberCount")
  String subscriberCount;
  @JsonKey(name: "videoCount")
  String videoCount;
  @JsonKey(name: "url")
  String url;

  Channel({
    required this.id,
    required this.title,
    required this.customUrl,
    required this.thumbnails,
    required this.subscriberCount,
    required this.videoCount,
    required this.url,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

@JsonSerializable()
class ChannelThumbnails {
  @JsonKey(name: "default")
  Default thumbnailsDefault;
  @JsonKey(name: "medium")
  Default medium;
  @JsonKey(name: "high")
  Default high;

  ChannelThumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory ChannelThumbnails.fromJson(Map<String, dynamic> json) => _$ChannelThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelThumbnailsToJson(this);
}

@JsonSerializable()
class Default {
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "width")
  int width;
  @JsonKey(name: "height")
  int height;

  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => _$DefaultFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultToJson(this);
}

@JsonSerializable()
class Vedio {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "publishedAt")
  DateTime publishedAt;
  @JsonKey(name: "thumbnails")
  VedioThumbnails thumbnails;
  @JsonKey(name: "likeCount")
  int likeCount;
  @JsonKey(name: "dislikeCount")
  int dislikeCount;
  @JsonKey(name: "viewCount")
  int viewCount;
  @JsonKey(name: "commentsCount")
  int commentsCount;
  @JsonKey(name: "reactionsCount")
  int reactionsCount;
  @JsonKey(name: "comments")
  List<dynamic> comments;
  @JsonKey(name: "reactions")
  List<dynamic> reactions;
  @JsonKey(name: "url")
  String url;

  Vedio({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.thumbnails,
    required this.likeCount,
    required this.dislikeCount,
    required this.viewCount,
    required this.commentsCount,
    required this.reactionsCount,
    required this.comments,
    required this.reactions,
    required this.url,
  });

  factory Vedio.fromJson(Map<String, dynamic> json) => _$VedioFromJson(json);

  Map<String, dynamic> toJson() => _$VedioToJson(this);
}

@JsonSerializable()
class VedioThumbnails {
  @JsonKey(name: "default")
  Default thumbnailsDefault;
  @JsonKey(name: "medium")
  Default medium;
  @JsonKey(name: "high")
  Default high;
  @JsonKey(name: "standard")
  Default standard;
  @JsonKey(name: "maxres")
  Default maxres;

  VedioThumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  factory VedioThumbnails.fromJson(Map<String, dynamic> json) => _$VedioThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$VedioThumbnailsToJson(this);
}
