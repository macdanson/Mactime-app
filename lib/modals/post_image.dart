class PostImage {
  String imgId, imgDesc, imgUrl, postId, isFeatured;

  PostImage(this.imgId, this.imgDesc, this.imgUrl, this.postId, this.isFeatured);

  PostImage.fromJson(Map<String, dynamic> jsonObject) {
    this.imgId = jsonObject['img_id'].toString();
    this.imgDesc = jsonObject['img_desc'].toString();
    this.imgUrl = jsonObject['img_url'].toString();
    this.postId = jsonObject['post_id'].toString();
    this.isFeatured = jsonObject['is_featured'].toString();
  }
}

