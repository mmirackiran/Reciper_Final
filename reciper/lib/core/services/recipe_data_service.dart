import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:reciper/model/recipe_model.dart';

class RecipeDataService {
  final String _folderPath = "assets/data/food";
  Future<String> _parseAssetFile(String locale) async {
    String assetPath = "$_folderPath/$locale.json";
    String json = await rootBundle.loadString(assetPath);
    return json;
  }

  Future<List<RecipeModel>> getDefaultRecipes(String locale) async {
    String jsonData = await _parseAssetFile(locale);
    List<dynamic> data = (await json.decode(jsonData))['recipes'];
    List<RecipeModel> animals =
        data.map((e) => RecipeModel.fromMap(e)).toList();
    return animals;
  }
}
