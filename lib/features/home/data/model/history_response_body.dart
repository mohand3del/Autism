
import 'package:json_annotation/json_annotation.dart';
part 'history_response_body.g.dart';

@JsonSerializable()
class HistoryResponseBody {
  @JsonKey(name: "fullData")
  FullData fullData;

  HistoryResponseBody({
    required this.fullData,
  });

  factory HistoryResponseBody.fromJson(Map<String, dynamic> json) => _$HistoryResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryResponseBodyToJson(this);
}

@JsonSerializable()
class FullData {
  @JsonKey(name: "videos")
  List<Video> videos;
  @JsonKey(name: "channels")
  List<Channel> channels;

  FullData({
    required this.videos,
    required this.channels,
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
  @JsonKey(name: "thumbnails")
  ChannelThumbnails thumbnails;
  @JsonKey(name: "url")
  String url;

  Channel({
    required this.id,
    required this.title,
    required this.thumbnails,
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
  @JsonKey(name: "url")
  String url;

  Video({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.thumbnails,
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
  Default? maxres;

  VideoThumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    this.maxres,
  });

  factory VideoThumbnails.fromJson(Map<String, dynamic> json) => _$VideoThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoThumbnailsToJson(this);
}
