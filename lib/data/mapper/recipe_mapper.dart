import 'package:recipe_app/data/dto/dto.dart';
import 'package:recipe_app/data/mapper/ingredient_mapper.dart';
import 'package:recipe_app/domain/model/model.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id != null ? id!.toString() : '',
      name: name ?? '',
      imageUrl: image ?? '',
      chef: chef ?? '',
      totalTimeMinutes: time ?? '',
      rating: rating != null ? rating!.toDouble() : 0.0,
      category: category ?? '',
      ingredients:
          ingredients != null
              ? ingredients!.map((e) => e.toIngredient()).toList()
              : [],
    );
  }
}
