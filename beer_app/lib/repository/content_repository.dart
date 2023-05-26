import 'package:beer_app/api/api.dart';
import 'package:beer_app/core/error/exceptions.dart';
import 'package:beer_app/repository/model/beer.dart';
import 'package:beer_app/repository/model_mapper.dart';
import 'package:beer_app/util/iterable_extensions.dart';

class ContentRepository {
  final Api _api;
  final ModelMapper _modelMapper;

  ContentRepository(this._api, this._modelMapper);

  Future<List<Beer>> getBeers() async {
    final result = await _api.getBeers();
    result.firstOrThrow(ResponseException(
        source: result, response: result, message: "No beer in response"));
    return _modelMapper.mapBeers(result);
  }

  Future<List<Beer>> getBeersByCategory() async {
    final result = await _api.getBeers();
    return _modelMapper.mapBeers(result);
  }
}
