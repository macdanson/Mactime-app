class PostTag {
  String tagId, tag;

  PostTag(this.tagId, this.tag);

  PostTag.fromJson(Map<String, dynamic> jsonObject) {
    this.tagId = jsonObject['tag_id'].toString();
    this.tag = jsonObject['tag'].toString();
  }
}
