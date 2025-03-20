// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostResponse _$CreatePostResponseFromJson(Map<String, dynamic> json) =>
    CreatePostResponse(
      newPost: NewPost.fromJson(json['newPost'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreatePostResponseToJson(CreatePostResponse instance) =>
    <String, dynamic>{
      'newPost': instance.newPost,
      'message': instance.message,
    };

NewPost _$NewPostFromJson(Map<String, dynamic> json) => NewPost(
      userId: json['userId'] as String,
      category: json['category'] as String,
      postType: json['postType'] as String,
      method: json['method'] as String,
      text: json['text'] as String,
      images: json['images'] as List<dynamic>,
      comments: json['comments'] as List<dynamic>,
      reactions: json['reactions'] as List<dynamic>,
      outerViewCount: (json['outerViewCount'] as num).toInt(),
      innerViewCount: (json['innerViewCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
      reactionsCount: (json['reactionsCount'] as num).toInt(),
      repostsNumber: (json['repostsNumber'] as num).toInt(),
      likesNumber: (json['likesNumber'] as num).toInt(),
      lovesNumber: (json['lovesNumber'] as num).toInt(),
      celebratesNumber: (json['celebratesNumber'] as num).toInt(),
      insightfulsNumber: (json['insightfulsNumber'] as num).toInt(),
      funnysNumber: (json['funnysNumber'] as num).toInt(),
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$NewPostToJson(NewPost instance) => <String, dynamic>{
      'userId': instance.userId,
      'category': instance.category,
      'postType': instance.postType,
      'method': instance.method,
      'text': instance.text,
      'images': instance.images,
      'comments': instance.comments,
      'reactions': instance.reactions,
      'outerViewCount': instance.outerViewCount,
      'innerViewCount': instance.innerViewCount,
      'commentsCount': instance.commentsCount,
      'reactionsCount': instance.reactionsCount,
      'repostsNumber': instance.repostsNumber,
      'likesNumber': instance.likesNumber,
      'lovesNumber': instance.lovesNumber,
      'celebratesNumber': instance.celebratesNumber,
      'insightfulsNumber': instance.insightfulsNumber,
      'funnysNumber': instance.funnysNumber,
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
