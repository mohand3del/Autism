// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_post_comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowPostCommentsResponse _$ShowPostCommentsResponseFromJson(
        Map<String, dynamic> json) =>
    ShowPostCommentsResponse(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowPostCommentsResponseToJson(
        ShowPostCommentsResponse instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['_id'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      comment: json['comment'] as String,
      subcomment: json['subcomment'] as bool,
      subcomments: (json['subcomments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      subcommentsNumber: (json['subcommentsNumber'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
      userData: UserData.fromJson(json['userData'] as Map<String, dynamic>),
      parentCommentId: json['parentCommentId'] as String?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      '_id': instance.id,
      'postId': instance.postId,
      'userId': instance.userId,
      'comment': instance.comment,
      'subcomment': instance.subcomment,
      'subcomments': instance.subcomments,
      'subcommentsNumber': instance.subcommentsNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
      'userData': instance.userData,
      'parentCommentId': instance.parentCommentId,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'image': instance.image,
      'type': instance.type,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };
