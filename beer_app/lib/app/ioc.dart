import 'package:beer_app/api/api.dart';
import 'package:beer_app/api/api_client.dart';
import 'package:beer_app/app/config/config.dart';
import 'package:beer_app/core/error/exception_mapper.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/l10n/l10n_handler.dart';
import 'package:beer_app/page/splash/splash_model.dart';
import 'package:beer_app/service/track/console_log_reporter.dart';
import 'package:beer_app/service/track/logger.dart';
import 'package:get_it/get_it.dart';

import '../core/provider/ui_handler.dart';
import '../l10n/gen/l10n.dart';
import '../repository/content_repository.dart';
import '../repository/model_mapper.dart';
import '../service/content_service.dart';
import '../service/firebase_init.dart';
import '../service/platform_service.dart';
import 'routing/app_router.dart';

class IoC {
  IoC._();

  static Future<void> init(Config config) async {
    await initFirebase();

    GetIt.I.registerSingleton<Config>(config);

    GetIt.I.registerSingleton<Logger>(
      Logger(
        ConsoleLogReporter(),
      ),
    );

    final platformService = await PlatformService.create();
    GetIt.I.registerSingleton(platformService);

    GetIt.I.registerSingleton<AppRouter>(AppRouter.create());

    GetIt.I.registerSingleton<ExceptionMapper>(ExceptionMapper());

    final l10nHandler = L10nHandler();
    GetIt.I.registerSingleton<L10nCache>(l10nHandler);
    GetIt.I.registerSingleton<L10nProvider>(l10nHandler);

    GetIt.I.registerSingleton<ApiClient>(ApiClient.create(
      config: config,
      logger: get(),
      exceptionMapper: get(),
    ));
    GetIt.I.registerSingleton(Api(get()));

    GetIt.I.registerFactory(() => UiHandler());

    GetIt.I.registerSingleton(BeerProvider());

    GetIt.I.registerSingleton(ModelMapper());
    GetIt.I.registerSingleton(ContentRepository(get(), get()));
    GetIt.I.registerSingleton(ContentService(get(), get()));
    GetIt.I.registerFactory(() => SplashModel(get(), get()));

    // GetIt.I.registerSingleton<AppContent>(AppContent());
    // GetIt.I.registerFactory(() => ActionHandler(get(), get(), get()));
    // GetIt.I.registerFactory(() => MainModel(get(), get(), get(), get(), get()));
    // GetIt.I.registerFactory(() => MenuModel(get(), get(), get()));
    // GetIt.I.registerFactory(() => CategoryModel(get(), get(), get()));
    // GetIt.I.registerFactory(() => PromotionModel(get(), get()));
    // GetIt.I.registerFactory(() => BusinessDetailsModel(get()));
  }

  static T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  static L10nProvider get l10nProvider => get<L10nProvider>();
  static L10n get l10n => l10nProvider.l10n;
  static Config get config => get<Config>();
  static Logger get logger => get<Logger>();
  static AppRouter get router => get<AppRouter>();
  //static AppContent get content => get<AppContent>();
}
