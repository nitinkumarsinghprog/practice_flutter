import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/common/recipe_card.dart';
import 'package:practice_flutter/cubit/recipes_cubit/recipes_cubit.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String message = 'Calling API...';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipes Screen")),
      body: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state is RecipesInitial) {
            return const Center(child: Text('Ready to load users'));
          }

          if (state is RecipesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is RecipesSuccess) {
            return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                final recipes = state.recipes[index];

                return RecipeCard(recipe: recipes);
              },
            );
          }

          if (state is RecipesError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
