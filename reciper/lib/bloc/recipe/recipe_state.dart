import 'package:equatable/equatable.dart';
import 'package:reciper/model/recipe_model.dart';

class RecipeState extends Equatable {
  final RecipeModel? todayMeal;
  final List<RecipeModel> recipes;

  const RecipeState({required this.recipes, this.todayMeal});

  @override
  List<Object?> get props => [recipes, todayMeal];
}
