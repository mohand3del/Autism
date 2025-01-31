import 'package:json_annotation/json_annotation.dart';
part 'get_post_by_id_response.g.dart';
@JsonSerializable()
class GetPostByIdResponse {
    @JsonKey(name: "post")
    GetPostByIdResponsePost post;

    GetPostByIdResponse({
        required this.post,
    });

    factory GetPostByIdResponse.fromJson(Map<String, dynamic> json) => _$GetPostByIdResponseFromJson(json);

    Map<String, dynamic> toJson() => _$GetPostByIdResponseToJson(this);
}

@JsonSerializable()
class GetPostByIdResponsePost {
    @JsonKey(name: "post")
    Post post;
    @JsonKey(name: "list")
    ListClass list;

    GetPostByIdResponsePost({
        required this.post,
        required this.list,
    });

    factory GetPostByIdResponsePost.fromJson(Map<String, dynamic> json) => _$GetPostByIdResponsePostFromJson(json);

    Map<String, dynamic> toJson() => _$GetPostByIdResponsePostToJson(this);
}

@JsonSerializable()
class ListClass {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "comments")
    List<String> comments;
    @JsonKey(name: "reactions")
    List<dynamic> reactions;

    ListClass({
        required this.id,
        required this.comments,
        required this.reactions,
    });

    factory ListClass.fromJson(Map<String, dynamic> json) => _$ListClassFromJson(json);

    Map<String, dynamic> toJson() => _$ListClassToJson(this);
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
    List<dynamic> images;
    @JsonKey(name: "comments")
    List<String> comments;
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
        required this.reactionsCount,
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
