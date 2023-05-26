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
  final IngredientsResponse? ingredients;

  BeerResponse(this.id, this.name, this.imageUrl, this.description, this.abv,
      this.firstBrewed, this.ibu, this.ingredients, this.tagline);

  factory BeerResponse.fromJson(Map<String, dynamic> json) =>
      _$BeerResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class IngredientsResponse {
  @JsonKey(name: 'yeast')
  String yeast;

  @JsonKey(name: 'malt')
  List<ComponentResponse> malt;

  @JsonKey(name: 'hops')
  List<ComponentResponse> hops;

  IngredientsResponse(this.yeast, this.hops, this.malt);

  factory IngredientsResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);
}

@JsonSerializable(createToJson: false)
class ComponentResponse {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'amount')
  AmountResponse amount;

  ComponentResponse(this.name, this.amount);

  factory ComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
}

@JsonSerializable(createToJson: false)
class AmountResponse {
  @JsonKey(name: 'value')
  double value;
  @JsonKey(name: 'unit')
  String unit;

  AmountResponse(this.value, this.unit);

  factory AmountResponse.fromJson(Map<String, dynamic> json) =>
      _$AmountFromJson(json);
}
