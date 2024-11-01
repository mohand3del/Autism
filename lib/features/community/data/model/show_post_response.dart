import 'package:json_annotation/json_annotation.dart';

part 'show_post_response.g.dart';


@JsonSerializable()
class ShowPostsResponse {
  @JsonKey(name: "data")
  List<Datum> data;

  ShowPostsResponse({
    required this.data,
  });

  factory ShowPostsResponse.fromJson(Map<String, dynamic> json) => _$ShowPostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowPostsResponseToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "post")
  Post post;
  @JsonKey(name: "user")
  User user;

  Datum({
    required this.post,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Post {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "userId")
  String userId;
  @JsonKey(name: "category")
  String category;
  @JsonKey(name: "postType")
  String postType;
  @JsonKey(name: "method")
  String method;
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "images")
  List<String> images;
  @JsonKey(name: "comments")
  List<dynamic> comments;
  @JsonKey(name: "reactions")
  List<dynamic> reactions;
  @JsonKey(name: "outerViewCount")
  int outerViewCount;
  @JsonKey(name: "innerViewCount")
  int innerViewCount;
  @JsonKey(name: "commentsCount")
  int commentsCount;
  @JsonKey(name: "reactionsNumber")
  int reactionsNumber;
  @JsonKey(name: "repostsNumber")
  int repostsNumber;
  @JsonKey(name: "likesNumber")
  int likesNumber;
  @JsonKey(name: "lovesNumber")
  int lovesNumber;
  @JsonKey(name: "celebratesNumber")
  int celebratesNumber;
  @JsonKey(name: "insightfulsNumber")
  int insightfulsNumber;
  @JsonKey(name: "funnysNumber")
  int funnysNumber;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  Post({
    required this.id,
    required this.userId,
    required this.category,
    required this.postType,
    required this.method,
    required this.text,
    required this.images,
    required this.comments,
    required this.reactions,
    required this.outerViewCount,
    required this.innerViewCount,
    required this.commentsCount,
    required this.reactionsNumber,
    required this.repostsNumber,
    required this.likesNumber,
    required this.lovesNumber,
    required this.celebratesNumber,
    required this.insightfulsNumber,
    required this.funnysNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "dateOfBirth")
  DateTime dateOfBirth;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.image,
    required this.type,
    required this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
