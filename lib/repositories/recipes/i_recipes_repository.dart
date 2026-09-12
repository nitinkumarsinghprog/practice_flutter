import 'package:practice_flutter/models/recipes_model.dart';

abstract class IRecipesRepository {
  Future<List<RecipesModel>> getRecipes();
}
