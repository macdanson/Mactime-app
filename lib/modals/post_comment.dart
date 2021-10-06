import 'package:mactimes/modals/author.dart';

class PostComment {
  String commentId, comment;
  Author author;

  PostComment(this.commentId, this.comment, this.author);

  PostComment.fromJson(Map<String, dynamic> jsonObject) {
    this.commentId = jsonObject['comment_id'].toString();
    this.comment = jsonObject['comment'];
    this.author = Author.fromJson(jsonObject['author']);
  }
}
