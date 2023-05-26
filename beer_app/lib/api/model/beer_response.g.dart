// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeerResponse _$BeerResponseFromJson(Map<String, dynamic> json) => BeerResponse(
      json['id'] as int,
      json['name'] as String?,
      json['image_url'] as String?,
      json['description'] as String?,
      (json['abv'] as num?)?.toDouble(),
      json['first_brewed'] as String?,
      (json['ibu'] as num?)?.toDouble(),
      json['ingredients'] == null
          ? null
          : Ingredients.fromJson(json['ingredients'] as Map<String, dynamic>),
      json['tagline'] as String?,
    );

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      json['yeast'] as String,
      (json['hops'] as List<dynamic>)
          .map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['malt'] as List<dynamic>)
          .map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      json['name'] as String,
      Amount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Amount _$AmountFromJson(Map<String, dynamic> json) => Amount(
      (json['value'] as num).toDouble(),
      json['unit'] as String,
    );
