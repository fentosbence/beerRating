import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  MediaQueryData get media => MediaQuery.of(this);
  double get screenWidth => media.size.width;
  double get statusBarHeight => media.padding.top;
  double get bottomNavBarHeight => media.viewPadding.bottom;

  double get textScaleFactor => media.textScaleFactor;

  double get headerImageHeight => screenWidth * 0.7;
}
