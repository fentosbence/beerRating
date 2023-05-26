import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'gen/l10n.dart';
import 'l10n_handler.dart';

extension L10nExtensions on BuildContext {
  L10n get l10n => L10n.of(this)!;

  static const supportedLocales = L10n.supportedLocales;

  static List<LocalizationsDelegate<dynamic>> getDelegates(L10nCache cache) {
    return [
      _L10nDelegate(cache),
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }

  static Locale? resolveLocale(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
  ) {
    final userPreferredLocales = locales ?? [];
    for (var userLocale in userPreferredLocales) {
      for (var supportedLocale in supportedLocales) {
        if (userLocale.languageCode == supportedLocale.languageCode) {
          return userLocale;
        }
      }
    }

    return const Locale('hu');
  }
}

/// Delegates logic to generated L10n delegate and saves actual locale and localizations
class _L10nDelegate extends LocalizationsDelegate<L10n> {
  final L10nCache _l10nUpdater;

  _L10nDelegate(this._l10nUpdater);

  @override
  bool isSupported(Locale locale) {
    return L10n.delegate.isSupported(locale);
  }

  @override
  Future<L10n> load(Locale locale) async {
    final l10n = await L10n.delegate.load(locale);
    _l10nUpdater.save(locale, l10n);
    return l10n;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<L10n> old) {
    return false;
  }
}
