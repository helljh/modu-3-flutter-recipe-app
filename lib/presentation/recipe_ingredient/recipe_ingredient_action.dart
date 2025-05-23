import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient_action.freezed.dart';

@freezed
sealed class RecipeIngredientAction with _$RecipeIngredientAction {
  const factory RecipeIngredientAction.onTapTabItem(int index) = OnTapTabItem;
}
