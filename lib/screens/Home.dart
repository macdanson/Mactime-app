

import 'package:flutter/material.dart';
import 'package:mactimes/api/postsApi.dart';
import 'package:mactimes/includes/drawer.dart';
import 'package:mactimes/includes/post_card.dart';
import 'package:mactimes/modals/post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Post> postsWithImages = [];
  PostsApi postsApi = PostsApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mac Times'.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: postsApi.fetchPosts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Not connection established'),
                    )
                  ],
                ),
              );
              break;
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ],
                ),
              );
              break;
            case ConnectionState.done:
              return _drawHomeScreen(snapshot.data);
              break;
          }
          return Container();
            }
      ),
    );
  }
}

Widget _drawHomeScreen(List<Post> posts) {
  List<Post> postsWithImages = [];
  for(Post post in posts){
    if(post.images.length > 0){
      postsWithImages.add(post);
    }
  }
  return Column(
    children: [
      _slider(postsWithImages),
      _drawRecentPosts(posts),
    ],
  );
}

Widget _slider(List<Post> posts){
  return Container(
    height: 200,
    child: PageView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index){
        return InkWell(
          onTap: (){
            print('You tapped ${posts[index].postTitle}');

          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image(image: NetworkImage(
                  posts[index].images[0].imgUrl
                ),
                fit: BoxFit.cover,),
              ),
              Align(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(posts[index].postTitle, style: TextStyle(color: Colors.white),),
                  ), color: Colors.grey.withAlpha(100)
                  ),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        );
      }
    ),
  );
}

Widget _drawRecentPosts(List<Post> posts) {
  return Flexible(
    child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(posts[index]);
        }),
  );
}