import 'package:beer_app/repository/model/beer.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

class BeerProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Beer>? beers;

  Beer? findById(int i) {
    return beers?.firstWhereOrNull((element) => element.id == i);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('beers', beers));
  }
}
