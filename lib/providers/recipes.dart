import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holamundo/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Recipe> recipes = [];
  List<Recipe> favoriteRecipe = [];

  Future<void> FetchRecipes() async {
    isLoading = true;

    //ANDROID 10.0.2.2
    //IOS 127.0.0.1
    //WEB localhost
    var url = Uri.parse("http://127.0.0.1:12346/recipes");
    try {
      var  response = await http.get(url);
      if (response.statusCode == 200) {
         var data = jsonDecode(response.body);
        recipes = List<Recipe>.from(
            data['recipes'].map((recipe) => Recipe.fromJSON(recipe)));
      } else {
        print('error${response.statusCode}');
        recipes = [];
      }
    } catch (e) {
      print('Error in request');
      recipes = [];
    } finally {
      isLoading = false;
    }

    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(Recipe recipe) async {

    var RecipeVarFavorite = favoriteRecipe.where((i) => i.id == recipe.id).toList();
    var isFavorito = (RecipeVarFavorite.length != 0);
    print(isFavorito);

    try {
      var url = Uri.parse("http://127.0.0.1:12346/favorites");
      var response = isFavorito
          ? await http.delete(url, body: json.encode({'id': recipe.id}))
          : await http.post(url, body: json.encode(recipe.toJson()));
      if (response.statusCode == 200) {
        if (isFavorito) {
          favoriteRecipe = favoriteRecipe.where((i) => i.id != recipe.id).toList();
        } else {
          favoriteRecipe.add(recipe);
        }
      } else {
        throw Exception("Failed to update favorite recipes");
      }
      
    } catch (e) {
      print('Error updating favorite recipe $e');
    }
    notifyListeners();
  }
}
