import 'package:flutter/material.dart';
import 'package:mactimes/api/categories_api.dart';
// import 'package:mactimes/includes/drawer.dart';
import 'package:mactimes/modals/category.dart';
import 'package:mactimes/screens/category_posts.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  CategoriesApi categoriesApi = CategoriesApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Categories'),
      ),
      // drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: categoriesApi.fetchCategories(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              return _drawCategoriesList(snapshot.data);
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

Widget _drawCategoriesList(List<Category> categories) {
  return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        String hexColor = categories[index].color.replaceAll('#', '0xFF');
        return Card(
          child: InkWell(
            onTap: () {
              // print('You Tapped ${categories[index].title}');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryPosts(categories[index].id,
                          categories[index].title, categories[index].color)));
            },
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(int.parse(hexColor)),
                    child: Text(categories[index].id, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  title: Text(categories[index].title, style: TextStyle(fontSize: 22),),
                )
              ],
            ),
          ),
        );
      });
}
