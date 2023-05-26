import 'package:beer_app/api/api_client.dart';
import 'package:beer_app/api/parser.dart';

import 'model/beer_response.dart';

class Api {
  final ApiClient _client;

  Api(this._client);

  Future<List<BeerResponse>> getBeers() {
    return _client.get(
      path: 'beers',
      mapper: (json) =>
          Parser.parseUpdateList(json, (e) => BeerResponse.fromJson(e)),
    );
  }

  Future<List<BeerResponse>> getSingleBeer({
    required int id,
  }) {
    return _client.get(
      path: 'beers/$id',
      mapper: (json) =>
          Parser.parseUpdateList(json, (e) => BeerResponse.fromJson(e)),
    );
  }

  Future<List<BeerResponse>> getBeersByName({required String type}) {
    return _client.get(
      path: 'beers',
      params: {'beer_name': type},
      mapper: (json) =>
          Parser.parseUpdateList(json, (e) => BeerResponse.fromJson(e)),
    );
  }
}
