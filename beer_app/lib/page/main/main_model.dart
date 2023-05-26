import 'package:beer_app/app/config/config.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/core/provider/ui_handler.dart';
import 'package:beer_app/repository/model/beer.dart';

import '../../app/ioc.dart';
import '../../app/routing/routes.dart';
import '../../repository/model/beer_type.dart';
import '../../service/content_service.dart';

class MainModel {
  final UiHandler uiHandler;
  final ContentService _contentService;

  MainModel(
    this.uiHandler,
    this._contentService,
  );

  Future<void> searchByType(BeerType? type) async {
    if (uiHandler.isLoading) return;

    try {
      uiHandler.setLoading();
      if (type == null) {
        await _contentService.loadContent();
      } else {
        await _contentService.searchBeers(type.name.toLowerCase());
      }
    } catch (e) {
      uiHandler.setError(e);
    } finally {
      uiHandler.clearLoading();
    }
  }
}
