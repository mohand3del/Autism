

import 'package:json_annotation/json_annotation.dart';
part 'channel_by_id_response_body.g.dart';
@JsonSerializable()
class ChannelByIdResponseBody {
  @JsonKey(name: "nextPageToken")
  String nextPageToken;
  @JsonKey(name: "prevPageToken")
  dynamic prevPageToken;
  @JsonKey(name: "fullData")
  FullData fullData;

  ChannelByIdResponseBody({
    required this.nextPageToken,
    required this.prevPageToken,
    required this.fullData,
  });

  factory ChannelByIdResponseBody.fromJson(Map<String, dynamic> json) => _$ChannelByIdResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelByIdResponseBodyToJson(this);
}

@JsonSerializable()
class FullData {
  @JsonKey(name: "channel")
  Channel channel;
  @JsonKey(name: "videos")
  List<Video> videos;

  FullData({
    required this.channel,
    required this.videos,
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
  @JsonKey(name: "description")
  String description;
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
    required this.description,
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
class Video {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "publishedAt")
  DateTime publishedAt;
  @JsonKey(name: "thumbnails")
  VideoThumbnails thumbnails;
  @JsonKey(name: "viewCount")
  String viewCount;
  @JsonKey(name: "url")
  String url;

  Video({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.thumbnails,
    required this.viewCount,
    required this.url,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class VideoThumbnails {
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

  VideoThumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  factory VideoThumbnails.fromJson(Map<String, dynamic> json) => _$VideoThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoThumbnailsToJson(this);
}
