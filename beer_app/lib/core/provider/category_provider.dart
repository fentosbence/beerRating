import 'package:beer_app/repository/model/beer.dart';
import 'package:beer_app/repository/model/beer_type.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

class CategoryProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<BeerType>? types;
  BeerType? active;

  CategoryProvider() {
    types = BeerType.values.toList();
    print(types!.length);
  }

  void selectType(BeerType type) {
    active = type;
    notifyListeners();
  }

  void deselect() {
    active = null;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('types', types));
  }
}
