import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:reciper/bloc/recipe/recipe_cubit.dart';
import 'package:reciper/bloc/recipe/recipe_state.dart';
import 'package:reciper/model/recipe_model.dart';
import 'package:reciper/ui/widgets/sheet/recipe_detail_bottom_sheet.dart';

class TodayMealCard extends StatelessWidget {
  const TodayMealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(builder: (context, state) {
      RecipeModel? recipe = state.todayMeal;
      return recipe == null
          ? Container()
          : Center(
              child: InkWell(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) => RecipeDetailBottomSheet(
                            recipe: recipe,
                          ));
                },
                child: SizedBox(
                  width: context.sized.dynamicWidth(0.9),
                  height: context.sized.dynamicHeight(0.25),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                              image: NetworkImage(recipe.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(18)),
                                  color: Colors.black.withOpacity(0.5)),
                              width: context.sized.dynamicWidth(0.9),
                              height: 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          recipe.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const Spacer(),
                                        Text(
                                          recipe.cuisine,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              )))
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
