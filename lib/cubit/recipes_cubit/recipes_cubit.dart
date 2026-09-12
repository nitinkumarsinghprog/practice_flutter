// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_flutter/models/recipes_model.dart';
import 'package:practice_flutter/repositories/recipes/i_recipes_repository.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final IRecipesRepository repository;

  RecipesCubit(this.repository) : super(RecipesInitial()) {
    getRecipes();
  }

  Future<void> getRecipes() async {
    emit(RecipesLoading());

    try {
      final recipes = await repository.getRecipes();

      emit(RecipesSuccess(recipes));
    } catch (e) {
      emit(RecipesError(e.toString()));
    }
  }
}
