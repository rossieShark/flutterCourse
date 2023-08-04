import '../../models/index.dart';
import '../../services/services.dart';

class PopularRecipeRepository {
  final PopularRecipeService popularRecipeService =
      PopularRecipeService.create();

  Future<List<RecipeFeed>> getUpcomingRecipes(
      int start, int limit, String tag) async {
    final apiRecipes = await popularRecipeService.getApi(start, limit, tag);

    final apiRecipeResponse = apiRecipes.body as Map<String, dynamic>;
    final apiRecipeList = RecipeResponce.fromJson(apiRecipeResponse);
    final recipeList = apiRecipeList.feed;

    return recipeList;
  }
}
