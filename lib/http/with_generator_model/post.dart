import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final int userId;
  final int id;
  final String title;
  final User user;
  @JsonKey(name: 'body')
  final String content;

  Post({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.user,
    @required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable(createFactory: true)
class User {
  String name;

  User(this.name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
