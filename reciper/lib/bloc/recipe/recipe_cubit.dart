import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_string/random_string.dart';
import 'package:reciper/core/services/recipe_data_service.dart';
import 'package:reciper/model/recipe_model.dart';

import 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit()
      : super(const RecipeState(
          recipes: [],
        ));
  final RecipeDataService _dataService = RecipeDataService();
  initRecipes(String locale) async {
    List<RecipeModel> list = await _dataService.getDefaultRecipes(locale);
    int randomIndex = randomBetween(0, list.length - 1);
    emit(RecipeState(recipes: list, todayMeal: list[randomIndex]));
  }
}
