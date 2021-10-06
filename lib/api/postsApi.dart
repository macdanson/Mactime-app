import 'dart:convert';
import 'package:mactimes/api/api_util.dart';
import 'package:http/http.dart' as http;
import 'package:mactimes/modals/post.dart';

class PostsApi {
  Future<List<Post>> fetchPosts() async {
    String allPosts = ApiUtil.baseUrl + ApiUtil.allPosts;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.get(allPosts, headers: headers);

    List<Post> posts = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var item in body['data']) {
        Post post = Post.fromJson(item);
        posts.add(post);
      }
    }
    return posts;
  }


}