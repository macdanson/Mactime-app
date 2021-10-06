import 'package:flutter/material.dart';
import 'package:mactimes/api/authorApi.dart';
import 'package:mactimes/modals/author.dart';
import 'package:pagination_view/pagination_view.dart';

class Authors extends StatefulWidget {
  @override
  _AuthorsState createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
  int page;
  PaginationViewType paginationViewType;
  GlobalKey<PaginationViewState> key;

  AuthorsApi authorsApi = AuthorsApi();

  @override
  void initState() {
    page = -1;
    paginationViewType = PaginationViewType.listView;
    key = GlobalKey<PaginationViewState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Authors'.toUpperCase()),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: authorsApi.fetchAuthors(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Author>> snapshot) {
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

Widget _drawCategoriesList(List<Author> authors) {
  return ListView.builder(
      itemCount: authors.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              print('You Tapped ${authors[index].authorName}');
            },
            child: Column(
              children: [
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image(
                        image: NetworkImage(authors[index].authorAvatar),
                      ),
                    ),
                    title: Text(
                      authors[index].authorName,
                      style: TextStyle(fontSize: 22),
                    )),
              ],
            ),
          ),
        );
      });
}
