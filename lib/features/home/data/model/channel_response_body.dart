

import 'package:json_annotation/json_annotation.dart';

part 'channel_response_body.g.dart';


@JsonSerializable()
class ChannelResponseBody {
  @JsonKey(name: "nextPageToken")
  String nextPageToken;
  @JsonKey(name: "prevPageToken")
  dynamic prevPageToken;
  @JsonKey(name: "fullData")
  List<FullDatum> fullData;

  ChannelResponseBody({
    required this.nextPageToken,
    required this.prevPageToken,
    required this.fullData,
  });

  factory ChannelResponseBody.fromJson(Map<String, dynamic> json) => _$ChannelResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelResponseBodyToJson(this);
}

@JsonSerializable()
class FullDatum {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "customUrl")
  String customUrl;
  @JsonKey(name: "thumbnails")
  Thumbnails thumbnails;
  @JsonKey(name: "subscriberCount")
  String subscriberCount;
  @JsonKey(name: "videoCount")
  String videoCount;
  @JsonKey(name: "url")
  String url;

  FullDatum({
    required this.id,
    required this.title,
    required this.customUrl,
    required this.thumbnails,
    required this.subscriberCount,
    required this.videoCount,
    required this.url,
  });

  factory FullDatum.fromJson(Map<String, dynamic> json) => _$FullDatumFromJson(json);

  Map<String, dynamic> toJson() => _$FullDatumToJson(this);
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