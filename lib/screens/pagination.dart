import 'package:mactimes/modals/user.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';


class Paginate extends StatefulWidget {
  @override
  _PaginateState createState() => _PaginateState();
}

class _PaginateState extends State<Paginate> {
  int page;
  PaginationViewType paginationViewType;
  GlobalKey<PaginationViewState> key;

  

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
        actions: <Widget>[
          (paginationViewType == PaginationViewType.listView)
              ? IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () => setState(
                    () => paginationViewType = PaginationViewType.gridView),
          )
              : IconButton(
            icon: Icon(Icons.list),
            onPressed: () => setState(
                    () => paginationViewType = PaginationViewType.listView),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => key.currentState.refresh(),
          ),
        ],
      ),
      body: PaginationView<User>(
        key: key,
        preloadedItems: <User>[
          User(faker.person.name(), faker.internet.email()),
          User(faker.person.name(), faker.internet.email()),
        ],
        paginationViewType: paginationViewType,
        itemBuilder: (BuildContext context, User user, int index) =>
        (paginationViewType == PaginationViewType.listView)
            ? ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
        )
            : GridTile(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(height: 8),
              Text(user.name),
              const SizedBox(height: 8),
              Text(user.email),
            ],
          ),
        ),
        pageFetch: pageFetch,
        pullToRefresh: true,
        onError: (dynamic error) => Center(
          child: Text('Some error occured'),
        ),
        onEmpty: Center(
          child: Text('Sorry! This is empty'),
        ),
        bottomLoader: Center(
          child: CircularProgressIndicator(),
        ),
        initialLoader: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<List<User>> pageFetch(int offset) async {
    print(offset);
    page = (offset / 20).round();
    final Faker faker = Faker();
    final List<User> nextUsersList = List.generate(
      20,
          (int index) => User(
        faker.person.name() + ' - $page$index',
        faker.internet.email(),
      ),
    );
    await Future<List<User>>.delayed(Duration(seconds: 1));
    return page == 5 ? [] : nextUsersList;
  }
}
