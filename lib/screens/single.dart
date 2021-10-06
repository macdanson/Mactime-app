import 'package:flutter/material.dart';
import 'package:mactimes/modals/post.dart';
import 'package:mactimes/modals/post_comment.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.post.postTitle,
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              background: Image(
                image: NetworkImage(widget.post.getFeatureImage()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: _commentsWidget(widget.post.comments[index]),
            );
            // }
          }, childCount: widget.post.comments.length)),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.comment_outlined,
                      color: Colors.blue,
                    ),
                    Text('326')
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('226'),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('306'),
                    Icon(
                      Icons.share_sharp,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commentsWidget(PostComment postComment) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.account_circle_outlined),
        ),
        title: Text(postComment.author.authorName),
        subtitle: Text(postComment.comment),
      ),
    );
  }
}
