import 'package:practice_flutter/models/recipes_model.dart';
import 'package:practice_flutter/repositories/recipes/i_recipes_repository.dart';
import 'package:practice_flutter/services/api_service.dart';

class RecipesRepository implements IRecipesRepository {
  final ApiService apiService;

  RecipesRepository(this.apiService);

  @override
  Future<List<RecipesModel>> getRecipes() async {
    final response = await apiService.get("https://dummyjson.com/recipes");

    final List<RecipesModel> recipes = (response.data['recipes'] as List)
        .map((recipes) => RecipesModel.fromJson(recipes))
        .toList();

    return recipes;
  }
}
