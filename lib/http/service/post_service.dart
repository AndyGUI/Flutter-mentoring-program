import 'dart:convert';

import 'package:flutter_mentoring_programm/http/model/post.dart';
import 'package:http/http.dart' as http;

const _postsURL = "https://jsonplaceholder.typicode.com/posts";

class PostService {
  // Let it be just a singleton
  static final PostService _singleton = PostService._internal();

  PostService._internal();

  factory PostService() {
    return _singleton;
  }

  Future<List<Post>> getPosts() async {
    // TODO apply convention!

    final res = await http.get(_postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<void> deletePost(int id) async {
    final client = MyCustomClient({"Token": "SuperMegaToken"});

    final res = await client.delete("$_postsURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }
}

class MyCustomClient extends http.BaseClient {
  http.Client _httpClient = http.Client();
  Map defaultHeaders;

  MyCustomClient(this.defaultHeaders);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request
      ..headers.addAll(defaultHeaders)
      ..maxRedirects = 1
      ..followRedirects = true;
    return _httpClient.send(request);
  }
}
