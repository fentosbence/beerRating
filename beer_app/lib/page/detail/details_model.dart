import 'package:beer_app/app/config/config.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/core/provider/ui_handler.dart';
import 'package:beer_app/repository/model/beer.dart';

import '../../app/ioc.dart';
import '../../app/routing/routes.dart';
import '../../repository/model/beer_type.dart';
import '../../service/content_service.dart';

class DetailsModel {
  final UiHandler uiHandler;
  final ContentService _contentService;

  DetailsModel(
    this.uiHandler,
    this._contentService,
  );

  Future<void> vote(int id, int value) async {
    if (uiHandler.isLoading) return;

    try {
      uiHandler.setLoading();
      await _contentService.sendVote(id, value);
    } catch (e) {
      uiHandler.setError(e);
    } finally {
      uiHandler.clearLoading();
    }
  }
}
