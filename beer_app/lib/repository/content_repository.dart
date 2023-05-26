import 'package:beer_app/api/api.dart';
import 'package:beer_app/core/error/exceptions.dart';
import 'package:beer_app/database/database.dart';
import 'package:beer_app/repository/model/beer.dart';
import 'package:beer_app/repository/model_mapper.dart';
import 'package:beer_app/util/iterable_extensions.dart';

class ContentRepository {
  final Api _api;
  final Database _db;
  final ModelMapper _modelMapper;

  ContentRepository(this._api, this._db, this._modelMapper);

  Future<List<Beer>> getBeers() async {
    final result = await _api.getBeers();
    result.firstOrThrow(ResponseException(
        source: result, response: result, message: "No beer in response"));

    final dbResult = await getDataFromDatabase();
    final mappedDbResult = _modelMapper.mapRatings(dbResult);
    return _modelMapper.mapBeers(result, mappedDbResult);
  }

  Future<List<Beer>> getBeersByCategory(String category) async {
    final result = await _api.getBeersByName(type: category);
    final dbResult = await getDataFromDatabase();
    final mappedDbResult = _modelMapper.mapRatings(dbResult);
    return _modelMapper.mapBeers(result, mappedDbResult);
  }

  Future<Map<String, dynamic>?> getDataFromDatabase() async {
    try {
      return await _db.read();
    } catch (e) {}
  }

  Future<void> sendVote(int id, int value) async {
    _db.write(MapEntry(id.toString(), value));
  }
}
