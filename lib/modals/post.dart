import 'package:flutter/cupertino.dart';
import 'package:mactimes/modals/author.dart';
import 'package:mactimes/modals/post_comment.dart';
import 'package:mactimes/modals/post_image.dart';
import 'package:mactimes/modals/post_tag.dart';

import 'category.dart';

class Post {
  String postId, postTitle, postBody, postType, metaData, updatedAt;
  List<PostImage> images;
  Category category;
  Author author;
  List<PostTag> tags;
  List<PostComment> comments;

  Post(
      this.postId,
      this.postTitle,
      this.postType,
      this.postBody,
      this.images,
      this.category,
      this.author,
      this.updatedAt,
      this.metaData,
      this.tags,
      this.comments);

  Post.fromJson(Map<String, dynamic> jsonObject) {
    this.postId = jsonObject['post_id'].toString();
    this.postTitle = jsonObject['post_title'].toString();
    this.postBody = jsonObject['post_body'].toString();
    this.postType = jsonObject['post_type'].toString();
    this.metaData = jsonObject['meta_date'].toString();
    this.updatedAt = jsonObject['updated_at'].toString();
    this.images = [];
    for (var item in jsonObject['images']) {
      images.add(PostImage.fromJson(item));
    }
    this.tags = [];
    for (var item in jsonObject['tags']) {
      tags.add(PostTag.fromJson(item));
    }
    this.category = Category.fromJson(jsonObject['category']);
    // this.author = Author.fromJson(jsonObject['author']);
    this.comments = [];
    for (var item in jsonObject['comments']) {
      comments.add(PostComment.fromJson(item));
    }
  }
  String getFeatureImage(){
    if(this.images.length > 0){
      return this.images[0].imgUrl;
    }
    return null;
  }

  ImageProvider getPostImage(){
    if( this.getFeatureImage() == null){
      return ExactAssetImage('images/holder.jpg');
    }
    return NetworkImage( this.getFeatureImage());
  }
}


