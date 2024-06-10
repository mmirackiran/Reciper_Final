import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/model/recipe_model.dart';
import 'package:reciper/ui/widgets/sheet/recipe_detail_bottom_sheet.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: context.sized.dynamicWidth(0.6),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                recipe.image,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              recipe.name,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 7),
            Text(
              recipe.cuisine,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: 7),
            Text(
              recipe.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelMedium
                  ?.copyWith(color: Colors.grey.shade600),
            ),
            const Spacer(),
            Center(
                child: TextButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) =>
                            RecipeDetailBottomSheet(recipe: recipe),
                      );
                    },
                    child: Text(context.translate.view_more)))
          ])),
    );
  }
}
