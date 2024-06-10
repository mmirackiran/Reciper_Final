import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:reciper/bloc/recipe/recipe_cubit.dart';
import 'package:reciper/bloc/recipe/recipe_state.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/gen/assets.gen.dart';
import 'package:reciper/ui/widgets/button/ask_to_ai_button.dart';
import 'package:reciper/ui/widgets/button/settings_button.dart';
import 'package:reciper/ui/widgets/card/recipe%20card.dart';
import 'package:reciper/ui/widgets/card/today_meal_card.dart';
import 'package:reciper/ui/widgets/other/space.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: context.sized.dynamicWidth(0.6),
          child: const AskToAiButton(),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Assets.images.icon.image(width: 30),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Reciper',
              ),
            ],
          ),
          actions: const [
            SettingsButton(),
          ],
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(context.translate.today_meal,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 25),
                const TodayMealCard(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(context.translate.for_you,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.recipes
                        .map((recipe) => RecipeCard(
                              recipe: recipe,
                            ))
                        .toList(),
                  ),
                ),
                const Space(heightRate: 0.15,),
              ],
            ),
          );
        }));
  }
}
