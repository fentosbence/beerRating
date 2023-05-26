import 'dart:async';
import 'package:beer_app/app/config/config.dart';
import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/core/provider/ui_handler.dart';
import 'package:beer_app/service/track/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/provider/beer_provider.dart';
import '../l10n/l10n.dart';
import 'package:provider/provider.dart';

void startApp() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );
    Config config = Config(baseApiUrl: 'https://api.punkapi.com/v2/');
    await IoC.init(config);
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IoC.get<BeerProvider>()),
        ],
        child: const App(),
      ),
    );
  }, (Object error, StackTrace stack) {
    IoC.logger.error(
      tag: Logger.tagZoned,
      error: error,
      stack: stack,
    );
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: IoC.router.routerConfig,
      title: 'BeerApp',
      localeListResolutionCallback: L10nExtensions.resolveLocale,
      localizationsDelegates: L10nExtensions.getDelegates(IoC.get()),
      supportedLocales: L10nExtensions.supportedLocales,
    );
  }
}
