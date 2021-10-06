import 'package:flutter/material.dart';
import 'package:mactimes/modals/post.dart';
import 'package:mactimes/screens/single.dart';
class PostCard extends StatelessWidget {
  final Post post;


  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          print('You tapped ${post.postTitle}');
          Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePost(post)));
        },
        child: ListTile(
          leading: Container(width: MediaQuery.of(context).size.width * 0.2,
              child: Image(image: post.getPostImage(),
                fit: BoxFit.cover,)),
          title: Text(post.postTitle),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(post.updatedAt),
            ],
          )
        ),
      ),
    );
  }

}
