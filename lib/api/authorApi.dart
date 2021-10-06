import 'dart:convert';
import 'package:mactimes/api/api_util.dart';
import 'package:http/http.dart' as http;
import 'package:mactimes/modals/author.dart';

class AuthorsApi {
  Future<List<Author>> fetchAuthors() async {
    String allAuthors = ApiUtil.baseUrl + ApiUtil.allAuthors;

    Map<String, String> headers = {
      'content-type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.get(allAuthors, headers: headers);

    List<Author> authors = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (var item in body['data']) {
        Author author = Author.fromJson(item);
        authors.add(author);
      }
    }
    return authors;
  }
}
