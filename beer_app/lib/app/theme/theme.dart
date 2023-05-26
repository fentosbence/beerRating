import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/service/platform_service.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static SystemUiOverlayStyle getSystemTheme({
    Brightness brightness = Brightness.dark,
    Color systemNavigationBarColor = ColorPalette.transparent,
  }) {
    Color navTrayColor;
    Brightness b;
    // NOTE: on android/ios light & dark behaves differently
    if (PlatformService.isIos) {
      navTrayColor = ColorPalette.transparent;
      if (brightness == Brightness.light) {
        b = Brightness.dark;
      } else {
        b = Brightness.light;
      }
    } else {
      b = brightness;
      navTrayColor = systemNavigationBarColor;
    }

    return SystemUiOverlayStyle(
      statusBarColor: ColorPalette.transparent,
      statusBarBrightness: b,
      statusBarIconBrightness: b,
      systemNavigationBarIconBrightness: b,
      systemNavigationBarColor: navTrayColor,
    );
  }

  AppTheme._();
}
