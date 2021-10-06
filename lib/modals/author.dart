class Author {
  String authorId, authorName, authorEmail, authorAvatar;

  Author(this.authorId, this.authorName, this.authorEmail, this.authorAvatar);

  Author.fromJson(Map<String, dynamic> jsonObject){
    this.authorId = jsonObject['author_id'].toString();
    this.authorName = jsonObject['author_name'].toString();
    this.authorEmail = jsonObject['author_email'].toString();
    this.authorAvatar = jsonObject['author_avatar'].toString();
  }
  
}

