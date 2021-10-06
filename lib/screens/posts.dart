import 'package:flutter/material.dart';
import 'package:mactimes/api/postsApi.dart';
import 'package:mactimes/includes/post_card.dart';
import 'package:mactimes/modals/post.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  ScrollController controller;
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all post'.toUpperCase()),
      ),
      body: Container(
        child: FutureBuilder(
          future: postsApi.fetchPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              return _drawPostsList(snapshot.data);
            } else if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _drawPostsList(List<Post> posts) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCard(posts[index]);
      });
}