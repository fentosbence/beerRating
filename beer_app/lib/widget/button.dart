import 'package:beer_app/app/theme/color_palette.dart';
import 'package:flutter/material.dart';

import '../app/theme/fonts.dart';
import '../app/theme/sizes.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const Button({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        surfaceTintColor: ColorPalette.yellow.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16, horizontal: Sizes.size24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.radius10)),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Fonts.titleMedium.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
