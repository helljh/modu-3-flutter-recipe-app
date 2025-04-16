import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/data_source.dart';
import 'package:recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';

void main() {
  group('Recipe ViewModel 테스트', () {
    test('fetchSavedRecipes 테스트', () async {
      final viewModel = SavedRecipesViewModel(
        getSavedRecipesUseCase: GetSavedRecipesUseCase(
          recipeRepository: RecipeRepositoryImpl(
            recipeDataSource: MockRecipeDataSourceImpl(),
          ),
          bookmarkRepository: BookmarkRepositoryImpl(),
        ),
      );

      expect(viewModel.state.recipes, isEmpty);

      await viewModel.fetchSavedRecipes();

      expect(viewModel.state.recipes.length, greaterThan(0));
      expect(viewModel.state.recipes.first.name, isNotNull);
    });
  });
}
