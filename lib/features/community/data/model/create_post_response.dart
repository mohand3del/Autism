import 'package:json_annotation/json_annotation.dart';


part 'create_post_response.g.dart';

@JsonSerializable()
class CreatePostResponse {
  @JsonKey(name: "newPost")
  NewPost newPost;
  @JsonKey(name: "message")
  String message;

  CreatePostResponse({
    required this.newPost,
    required this.message,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) => _$CreatePostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostResponseToJson(this);
}

@JsonSerializable()
class NewPost {
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
  List<dynamic> images;
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
  @JsonKey(name: "reactionsCount")
  int reactionsCount;
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
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;

  NewPost({
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
    required this.reactionsCount,
    required this.repostsNumber,
    required this.likesNumber,
    required this.lovesNumber,
    required this.celebratesNumber,
    required this.insightfulsNumber,
    required this.funnysNumber,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory NewPost.fromJson(Map<String, dynamic> json) => _$NewPostFromJson(json);

  Map<String, dynamic> toJson() => _$NewPostToJson(this);
}
