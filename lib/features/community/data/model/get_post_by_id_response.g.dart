// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostByIdResponse _$GetPostByIdResponseFromJson(Map<String, dynamic> json) =>
    GetPostByIdResponse(
      post: GetPostByIdResponsePost.fromJson(
          json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPostByIdResponseToJson(
        GetPostByIdResponse instance) =>
    <String, dynamic>{
      'post': instance.post,
    };

GetPostByIdResponsePost _$GetPostByIdResponsePostFromJson(
        Map<String, dynamic> json) =>
    GetPostByIdResponsePost(
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      list: ListClass.fromJson(json['list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPostByIdResponsePostToJson(
        GetPostByIdResponsePost instance) =>
    <String, dynamic>{
      'post': instance.post,
      'list': instance.list,
    };

ListClass _$ListClassFromJson(Map<String, dynamic> json) => ListClass(
      id: json['_id'] as String,
      comments:
          (json['comments'] as List<dynamic>).map((e) => e as String).toList(),
      reactions: json['reactions'] as List<dynamic>,
    );

Map<String, dynamic> _$ListClassToJson(ListClass instance) => <String, dynamic>{
      '_id': instance.id,
      'comments': instance.comments,
      'reactions': instance.reactions,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      category: json['category'] as String,
      postType: json['postType'] as String,
      method: json['method'] as String,
      text: json['text'] as String,
      images: json['images'] as List<dynamic>,
      comments:
          (json['comments'] as List<dynamic>).map((e) => e as String).toList(),
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      '_id': instance.id,
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
