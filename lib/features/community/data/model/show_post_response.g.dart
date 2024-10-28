// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowPostsResponse _$ShowPostsResponseFromJson(Map<String, dynamic> json) =>
    ShowPostsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowPostsResponseToJson(ShowPostsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'post': instance.post,
      'user': instance.user,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      category: json['category'] as String,
      postType: json['postType'] as String,
      method: json['method'] as String,
      text: json['text'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      comments: json['comments'] as List<dynamic>,
      reactions: json['reactions'] as List<dynamic>,
      outerViewCount: (json['outerViewCount'] as num).toInt(),
      innerViewCount: (json['innerViewCount'] as num).toInt(),
      commentsNumber: (json['commentsNumber'] as num).toInt(),
      reactionsNumber: (json['reactionsNumber'] as num).toInt(),
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
      'commentsNumber': instance.commentsNumber,
      'reactionsNumber': instance.reactionsNumber,
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

User _$UserFromJson(Map<String, dynamic> json) => User(
      gender: json['gender'] as String,
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      type: json['type'] as String,
      image: json['image'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'gender': instance.gender,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'type': instance.type,
      'image': instance.image,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };
