import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mactimes/api/categories_api.dart';
import 'package:mactimes/screens/Home.dart';

void main() {
  runApp(MacTimesApp());
}

class MacTimesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mac Times'.toUpperCase(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  CategoriesApi categoriesApi = CategoriesApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}
