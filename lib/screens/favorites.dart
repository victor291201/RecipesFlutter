import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holamundo/models/recipe.dart';
import 'package:holamundo/providers/recipes.dart';
import 'package:holamundo/screens/recipe_detail.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<RecipesProvider>(
          builder: (context, recipesProvider, child) {
            final favoritesRecipes = recipesProvider.favoriteRecipe;

            return favoritesRecipes.isEmpty
                ? Center(
                    child: Text(AppLocalizations.of(context)!.noRecipes),
                  )
                : ListView.builder(
                    itemCount: favoritesRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = favoritesRecipes[index];
                      return favoriteRecipesCard(recipe: recipe);
                    },
                  );
          },
        ));
  }
}

class favoriteRecipesCard extends StatelessWidget {
  final Recipe recipe;
  const favoriteRecipesCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipeData: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
            child: Row(children: <Widget>[
              Container(
                height: 125,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        Image.network(fit: BoxFit.cover, recipe.image_link)),
              ),
              SizedBox(
                width: 26,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(recipe.name,
                      style: TextStyle(fontSize: 16, fontFamily: "Quicksand")),
                  SizedBox(
                    height: 4,
                  ),
                  Container(height: 2, width: 75, color: Colors.orange),
                  SizedBox(
                    height: 4,
                  ),
                  Text('By ${recipe.author}',
                      style: TextStyle(fontSize: 16, fontFamily: "Quicksand")),
                ],
              ),
            ]),
          ),
        ),
      ),
    );}
}
