import 'package:beer_app/repository/model/beer.dart';
import 'package:flutter/foundation.dart';

class BeerProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Beer>? beers;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('beers', beers));
  }
}
