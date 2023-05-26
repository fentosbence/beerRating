import 'package:flutter/material.dart';

import 'gen/l10n.dart';

abstract class L10nCache {
  void save(Locale locale, L10n l10n);
}

abstract class L10nProvider {
  Locale get locale;
  String get languageCode;
  L10n get l10n;
}

class L10nHandler implements L10nCache, L10nProvider {
  late L10n _l10n;
  late Locale _locale;

  @override
  L10n get l10n => _l10n;

  @override
  Locale get locale => _locale;

  @override
  String get languageCode => _locale.languageCode;

  @override
  void save(Locale locale, L10n l10n) {
    _locale = locale;
    _l10n = l10n;
  }
}
