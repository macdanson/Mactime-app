import 'dart:convert';
import 'package:mactimes/api/api_util.dart';
import 'package:http/http.dart' as http;
import 'package:mactimes/modals/category.dart';
import 'package:mactimes/modals/post.dart';

class CategoriesApi {
  Future<List<Category>> fetchCategories() async {
    String allCategories = ApiUtil.baseUrl + ApiUtil.allCategories;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.get(allCategories, headers: headers);

    List<Category> categories = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var item in body['data']) {
        Category category = Category.fromJson(item);
        categories.add(category);
        // print( category.title );
      }
    }
    return categories;
  }

  Future<List<Post>> fetchCategoryPosts(String categoryID) async {
    String categoryPosts = ApiUtil.allCategoryPosts(categoryID);

    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.get(categoryPosts, headers: headers);
    List<Post> posts = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var item in body['data']) {
        Post post = Post.fromJson(item);
        posts.add(post);
        // print(post.postBody);
      }
    }
    return posts;
  }
}
