import 'package:beer_app/api/model/beer_response.dart';
import 'package:collection/collection.dart';

import 'model/beer.dart';

class ModelMapper {
  List<Beer> mapBeers(
    List<BeerResponse> items,
  ) {
    return items.map((i) => mapBeer(i)).whereNotNull().toList();
  }

  Beer? mapBeer(
    BeerResponse r,
  ) {
    if (r.name == null || r.name?.isEmpty == true) {
      return null;
    }

    return Beer(
      id: r.id,
      name: r.name!,
      imageUrl: r.imageUrl,
      description: r.description,
      alcohol: r.abv,
      firstBrewed: r.firstBrewed,
      ibu: r.ibu,
      tagline: r.tagline,
    );
  }
}
