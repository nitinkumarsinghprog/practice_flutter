import 'package:flutter/material.dart';
import 'package:practice_flutter/models/recipes_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipesModel recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 10),

            Text(
              recipe.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text('Cuisine: ${recipe.cuisine}'),

            Text('Rating: ${recipe.rating}'),

            Text('Prep Time: ${recipe.prepTimeMinutes} min'),

            Text('Cook Time: ${recipe.cookTimeMinutes} min'),
          ],
        ),
      ),
    );
  }
}
