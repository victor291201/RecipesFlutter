import 'package:flutter/material.dart';
import 'package:holamundo/models/recipe.dart';
import 'package:holamundo/providers/recipes.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipeData;
  const RecipeDetail({super.key, required this.recipeData});

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  bool isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isFavorite = Provider.of<RecipesProvider>(context, listen: false)
        .favoriteRecipe
        .contains(widget.recipeData);
    ;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.recipeData.name,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Provider.of<RecipesProvider>(context, listen: false)
                    .toggleFavoriteStatus(widget.recipeData);
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Image.network(widget.recipeData.image_link),
              SizedBox(
                height: 8,
              ),
              Text(widget.recipeData.name),
              SizedBox(
                height: 8,
              ),
              Text('By ${widget.recipeData.author}'),
              SizedBox(
                height: 8,
              ),
              Text('Recipe steps:'),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  for (var step in widget.recipeData.recipeSteps)
                    Text(
                      '- $step',
                      textAlign: TextAlign.start,
                    )
                ]),
              ),
            ],
          ),
        ));
  }
}
