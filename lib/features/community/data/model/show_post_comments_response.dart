


import 'package:json_annotation/json_annotation.dart';

part 'show_post_comments_response.g.dart';
@JsonSerializable()
class ShowPostCommentsResponse {
    @JsonKey(name: "comments")
    List<Comment> comments;

    ShowPostCommentsResponse({
        required this.comments,
    });

    factory ShowPostCommentsResponse.fromJson(Map<String, dynamic> json) => _$ShowPostCommentsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ShowPostCommentsResponseToJson(this);
}

@JsonSerializable()
class Comment {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "postId")
    String postId;
    @JsonKey(name: "userId")
    String userId;
    @JsonKey(name: "comment")
    String comment;
    @JsonKey(name: "subcomment")
    bool subcomment;
    @JsonKey(name: "subcomments")
    List<Comment> subcomments;
    @JsonKey(name: "subcommentsNumber")
    int subcommentsNumber;
    @JsonKey(name: "createdAt")
    DateTime createdAt;
    @JsonKey(name: "updatedAt")
    DateTime updatedAt;
    @JsonKey(name: "__v")
    int v;
    @JsonKey(name: "userData")
    UserData userData;
    @JsonKey(name: "parentCommentId")
    String? parentCommentId;

    Comment({
        required this.id,
        required this.postId,
        required this.userId,
        required this.comment,
        required this.subcomment,
        required this.subcomments,
        required this.subcommentsNumber,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.userData,
        this.parentCommentId,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

    Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class UserData {
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

    UserData({
        required this.id,
        required this.name,
        required this.email,
        required this.gender,
        required this.image,
        required this.type,
        required this.dateOfBirth,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

    Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
