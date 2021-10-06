
import 'package:flutter/material.dart';
import 'package:mactimes/api/categories_api.dart';
import 'package:mactimes/includes/post_card.dart';
import 'package:mactimes/modals/post.dart';

class CategoryPosts extends StatefulWidget {
  final String categoryID;
  final String categoryName;
  final String categoryColor;
  CategoryPosts(this.categoryID, this.categoryName, this.categoryColor);
  @override
  _CategoryPostsState createState() => _CategoryPostsState();
}

class _CategoryPostsState extends State<CategoryPosts> {
  CategoriesApi categoriesApi = CategoriesApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} posts'.toUpperCase()),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: FutureBuilder(
          future: categoriesApi.fetchCategoryPosts(widget.categoryID),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              return _drawCategoryPosts(snapshot.data);
            } else if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Errors: ${snapshot.error}'),
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

Widget _drawCategoryPosts(List<Post> posts) {
  return ListView.builder(
      itemCount: posts.length,

      itemBuilder: (BuildContext context, int index) {
        return PostCard(posts[index]);
      });
}
