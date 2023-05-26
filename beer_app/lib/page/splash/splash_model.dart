import 'package:beer_app/app/config/config.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/core/provider/ui_handler.dart';
import 'package:beer_app/repository/model/beer.dart';

import '../../app/ioc.dart';
import '../../app/routing/routes.dart';
import '../../service/content_service.dart';

class SplashModel {
  final UiHandler uiHandler;
  final ContentService _contentService;

  SplashModel(
    this.uiHandler,
    this._contentService,
  );

  late int _startTimestamp;

  Future<void> loadAppContent() async {
    _startTimestamp = DateTime.now().millisecondsSinceEpoch;

    try {
      uiHandler.setLoading();
      await _contentService.loadContent();
      await _waitDefaultTimeout();

      IoC.router.set(AppRoute.main());
    } catch (e) {
      uiHandler.setError(e, retryCallback: loadAppContent);
    } finally {
      uiHandler.clearLoading();
    }
  }

  Future<void> _waitDefaultTimeout() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final timestampDiff = timestamp - _startTimestamp;

    if (timestampDiff < 2000) {
      final wait = 2000 - timestampDiff;
      await Future.delayed(Duration(milliseconds: wait));
    }
  }
}
