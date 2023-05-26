import 'ingredients.dart';

class Beer {
  final int id;
  final String name;
  final String? tagline;
  final String? firstBrewed;
  final String? description;
  final double? alcohol;
  final double? ibu;
  final String? imageUrl;
  final Ingredients? ingredients;
  final int rating;

  Beer({
    required this.id,
    required this.name,
    this.tagline,
    this.ibu,
    this.firstBrewed,
    this.description,
    this.imageUrl,
    this.alcohol,
    this.ingredients,
    required this.rating,
  });
}
