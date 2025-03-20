
import 'package:json_annotation/json_annotation.dart';


part 'recource_response_body.g.dart';
@JsonSerializable()
@JsonSerializable()
class ResourceResponseBody {
  @JsonKey(name: "fullData")
  List<FullDatum> fullData;

  ResourceResponseBody({
    required this.fullData,
  });

  factory ResourceResponseBody.fromJson(Map<String, dynamic> json) => _$ResourceResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceResponseBodyToJson(this);
}

@JsonSerializable()
class FullDatum {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "snippet")
  String snippet;
  @JsonKey(name: "link")
  String link;
  @JsonKey(name: "favicon")
  String? favicon;
  @JsonKey(name: "source")
  String source;
  @JsonKey(name: "__v")
  int v;
  @JsonKey(name: "thumbnail")
  String? thumbnail;

  FullDatum({
    required this.id,
    required this.title,
    required this.snippet,
    required this.link,
    this.favicon,
    required this.source,
    required this.v,
    this.thumbnail,
  });

  factory FullDatum.fromJson(Map<String, dynamic> json) => _$FullDatumFromJson(json);

  Map<String, dynamic> toJson() => _$FullDatumToJson(this);
}
