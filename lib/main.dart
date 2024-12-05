import 'package:flutter/material.dart';
import 'package:holamundo/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Hola mundo', home: RecipeBook());
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text(
                "Recipe Book",
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: [Tab(icon: Icon(Icons.home), text: "Home")]),
            ),
            body: TabBarView(children: [HomeScreen()])));
  }
}
