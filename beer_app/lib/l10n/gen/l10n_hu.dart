import 'l10n.dart';

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

  @override
  String get common_alright => 'Rendben';

  @override
  String get common_cancel => 'Mégsem';

  @override
  String get common_retry => 'Újrapróbálom';

  @override
  String get error_no_network => 'Kérlek, ellenőrizd, hogy csatlakozva vagy-e az internetre!';

  @override
  String get error_oops => 'Ajjaj';

  @override
  String get error_oops_something_went_wrong => 'Hoppá, valami hiba történt';

  @override
  String get error_server => 'Szerver hiba történt, kérlek, próbálkozz később!';

  @override
  String get error_try_again_later => 'Kérlek, próbálkozz később!';
}
