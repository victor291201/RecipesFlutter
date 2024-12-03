import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Recipe Book",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(children: <Widget>[
            Container(
              height: 125,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(),
              ),
            ),
            SizedBox(
              width: 26,
            ),
            Column(
              children: <Widget>[
                Text("Aureliano Buendia"),
                Text("Ensalada dulce"),
                Container(height: 2, width: 75, color: Colors.orange)
              ],
            ),
          ]),
        ),
      ),
    );;
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Recipe Book",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(children: <Widget>[
            Container(
              height: 125,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(),
              ),
            ),
            SizedBox(
              width: 26,
            ),
            Column(
              children: <Widget>[
                Text("Aureliano Buendia"),
                Text("Ensalada dulce"),
                Container(height: 2, width: 75, color: Colors.orange)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
