import 'package:flutter/material.dart';
import 'package:mactimes/screens/authors.dart';
import 'package:mactimes/screens/categories.dart';
import 'package:mactimes/screens/pagination.dart';
import 'package:mactimes/screens/posts.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.list,
              text: 'Categories'.toUpperCase(),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Categories()))
                  }),
          Divider(),
          _createDrawerItem(
              icon: Icons.post_add,
              text: 'All Posts'.toUpperCase(),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Posts()))
                  }),
          Divider(),
          _createDrawerItem(
              icon: Icons.pages,
              text: 'All Authors'.toUpperCase(),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Paginate()))
                  }),
          Divider(),
          _createDrawerItem(
              icon: Icons.pages,
              text: 'Other Authors'.toUpperCase(),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Authors()))
                  }),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('images/bg.jpg'))),
    accountName: Text(
      "Nahabwe Danson".toUpperCase(),
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    accountEmail:
        Text("macdanson2@gmail.com", style: TextStyle(color: Colors.white)),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.account_circle,
        size: 70.0,
        color: Colors.blueGrey,
      ),
    ),
    onDetailsPressed: () {},
    arrowColor: Colors.white,
  );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
