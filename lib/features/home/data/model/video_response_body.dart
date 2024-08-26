

import 'package:json_annotation/json_annotation.dart';
part 'video_response_body.g.dart';

@JsonSerializable()
class VideoResponseBody {
  @JsonKey(name: "nextPageToken")
  String nextPageToken;
  @JsonKey(name: "prevPageToken")
  dynamic prevPageToken;
  @JsonKey(name: "fullData")
  List<FullDatum> fullData;

  VideoResponseBody({
    required this.nextPageToken,
    required this.prevPageToken,
    required this.fullData,
  });

  factory VideoResponseBody.fromJson(Map<String, dynamic> json) => _$VideoResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseBodyToJson(this);
}

@JsonSerializable()
class FullDatum {
  @JsonKey(name: "vedio")
  Vedio vedio;
  @JsonKey(name: "channel")
  Channel channel;

  FullDatum({
    required this.vedio,
    required this.channel,
  });

  factory FullDatum.fromJson(Map<String, dynamic> json) => _$FullDatumFromJson(json);

  Map<String, dynamic> toJson() => _$FullDatumToJson(this);
}

@JsonSerializable()
class Channel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "thumbnails")
  Thumbnails thumbnails;
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
class Thumbnails {
  @JsonKey(name: "default")
  Default thumbnailsDefault;
  @JsonKey(name: "medium")
  Default medium;
  @JsonKey(name: "high")
  Default high;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => _$ThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
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
  Id id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "publishedAt")
  DateTime publishedAt;
  @JsonKey(name: "thumbnails")
  Thumbnails thumbnails;
  @JsonKey(name: "url")
  String url;

  Vedio({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.thumbnails,
    required this.url,
  });

  factory Vedio.fromJson(Map<String, dynamic> json) => _$VedioFromJson(json);

  Map<String, dynamic> toJson() => _$VedioToJson(this);
}

@JsonSerializable()
class Id {
  @JsonKey(name: "kind")
  Kind kind;
  @JsonKey(name: "videoId")
  String videoId;

  Id({
    required this.kind,
    required this.videoId,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

enum Kind {
  @JsonValue("youtube#video")
  YOUTUBE_VIDEO
}
