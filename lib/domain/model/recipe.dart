import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
@JsonSerializable()
class Recipe with _$Recipe {
  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String chef;
  @override
  final String totalTimeMinutes;
  @override
  final double rating;
  @override
  final String category;
  @override
  final List<Ingredient> ingredients;
  @override
  final bool isFavorite;

  const Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.chef,
    required this.totalTimeMinutes,
    required this.rating,
    required this.category,
    required this.ingredients,
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
