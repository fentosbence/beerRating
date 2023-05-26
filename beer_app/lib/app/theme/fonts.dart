import 'package:flutter/material.dart';

import 'color_palette.dart';

extension Fonts on TextStyle {
  static const family = 'Poppins';
  static const defaultColor = ColorPalette.black;
  static const weightNormal = FontWeight.w400;
  static const weightMedium = FontWeight.w500;
  static const weightBold = FontWeight.w700;

  static const TextStyle headlineLarge = AppTextStyle(32.0, 47.2);
  static const TextStyle headlineMedium = AppTextStyle(28.0, 36.0);
  static const TextStyle headlineSmall = AppTextStyle(24.0, 32.0);
  static const TextStyle titleLarge = AppTextStyle(20.0, 29.5, FontWeight.w600);
  static const TextStyle titleMedium = AppTextStyle(16.0, 21.12);
  static const TextStyle titleSmall = AppTextStyle(14.0, 20.0, weightMedium);
  static const TextStyle labelLarge = AppTextStyle(14.0, 20.0, weightMedium);
  static const TextStyle labelSmall = AppTextStyle(11.0, 16.0);
  static const TextStyle bodyLarge = AppTextStyle(16.0, 24.0);
  static const TextStyle bodyMedium = AppTextStyle(14.0, 20.0);
  static const TextStyle bodySmall = AppTextStyle(12.0, 16.0);

  TextStyle get bold => copyWith(fontWeight: weightBold);
  TextStyle get medium => copyWith(fontWeight: weightMedium);
  TextStyle get yellow => copyWith(color: ColorPalette.yellow);
  TextStyle get spaced => copyWith(letterSpacing: 2);
}

class AppTextStyle extends TextStyle {
  const AppTextStyle(double fontSize, double lineHeight, [FontWeight? weight])
      : super(
            fontFamily: Fonts.family,
            fontWeight: weight ?? Fonts.weightNormal,
            color: Fonts.defaultColor,
            fontSize: fontSize,
            height: lineHeight / fontSize);
}
