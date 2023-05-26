import 'package:beer_app/repository/model/beer.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

class BeerProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Beer>? _beers;

  List<Beer>? get beers => _beers;

  Beer? findById(int i) {
    return beers?.firstWhereOrNull((element) => element.id == i);
  }

  void updateBeers(List<Beer> b) {
    _beers = b;
    notifyListeners();
  }

  void updateRatings(int id, int newRating) {
    _beers?.firstWhere((element) => element.id == id).rating == newRating;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('beers', beers));
  }
}
