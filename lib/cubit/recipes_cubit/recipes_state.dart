part of 'recipes_cubit.dart';

@immutable
sealed class RecipesState {}

final class RecipesInitial extends RecipesState {}

final class RecipesLoading extends RecipesState {}

final class RecipesSuccess extends RecipesState {
  final List<RecipesModel> recipes;

  RecipesSuccess(this.recipes);
}

final class RecipesError extends RecipesState {
  final String message;

  RecipesError(this.message);
}
