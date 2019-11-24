// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['body'] as String);
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'user': instance.user,
      'body': instance.content
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['name'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'name': instance.name};
