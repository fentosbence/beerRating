import 'package:json_annotation/json_annotation.dart';

part 'beer_response.g.dart';

@JsonSerializable(createToJson: false, nullable: true)
class BeerResponse {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'tagline')
  final String? tagline;

  @JsonKey(name: 'first_brewed')
  final String? firstBrewed;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'abv')
  final double? abv;

  @JsonKey(name: 'ibu')
  final double? ibu;

  @JsonKey(name: 'ingredients')
  final Ingredients? ingredients;

  BeerResponse(this.id, this.name, this.imageUrl, this.description, this.abv,
      this.firstBrewed, this.ibu, this.ingredients, this.tagline);

  factory BeerResponse.fromJson(Map<String, dynamic> json) =>
      _$BeerResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Ingredients {
  @JsonKey(name: 'yeast')
  String yeast;

  @JsonKey(name: 'malt')
  List<Component> malt;

  @JsonKey(name: 'hops')
  List<Component> hops;

  Ingredients(this.yeast, this.hops, this.malt);

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Component {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'amount')
  Amount amount;

  Component(this.name, this.amount);

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
}

@JsonSerializable(createToJson: false)
class Amount {
  @JsonKey(name: 'value')
  double value;
  @JsonKey(name: 'unit')
  String unit;

  Amount(this.value, this.unit);

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
}
