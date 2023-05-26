import 'package:beer_app/api/model/beer_response.dart';
import 'package:beer_app/repository/model/ingredients.dart';
import 'package:collection/collection.dart';

import 'model/beer.dart';

class ModelMapper {
  List<Beer> mapBeers(
    List<BeerResponse> items,
    Map<int, int>? ratings,
  ) {
    return items.map((i) => mapBeer(i, ratings)).whereNotNull().toList();
  }

  Beer? mapBeer(
    BeerResponse r,
    Map<int, int>? ratings,
  ) {
    if (r.name == null || r.name?.isEmpty == true) {
      return null;
    }

    int? rating = ratings?[r.id];


    return Beer(
      id: r.id,
      name: r.name!,
      imageUrl: r.imageUrl,
      description: r.description,
      alcohol: r.abv,
      firstBrewed: r.firstBrewed,
      ibu: r.ibu,
      tagline: r.tagline,
      ingredients: _mapIngredients(r.ingredients),
      rating: rating ?? 0,
    );
  }

  Ingredients? _mapIngredients(IngredientsResponse? i) {
    if (i == null) return null;

    return Ingredients(
        malt: _mapComponents(i.malt),
        hops: _mapComponents(i.hops),
        yeast: i.yeast);
  }

  List<Component> _mapComponents(List<ComponentResponse> c) {
    return c.map((i) => Component(i.name, _mapAmount(i.amount))).toList();
  }

  Amount _mapAmount(AmountResponse a) {
    return Amount(a.value, a.unit);
  }

  Map<int, int>? mapRatings(Map<String, dynamic>? ratings) {
    return ratings?.map((key, value) => MapEntry(int.parse(key), value as int));
  }
}
