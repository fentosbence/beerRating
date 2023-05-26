import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/app/theme/sizes.dart';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const Button({
    super.key,
    required this.text,
    this.onTap,
    this.buttonStyle,
    this.textStyle,
  });

  factory Button.primary({
    Key? key,
    required String text,
    TextStyle? style,
    double? radius,
    VoidCallback? onTap,
  }) {
    return Button(
      key: key,
      text: text,
      onTap: onTap,
      textStyle: style ?? Fonts.titleLarge,
      buttonStyle: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12, horizontal: Sizes.size24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? Sizes.radius10),
        ),
        side: const BorderSide(color: ColorPalette.black, width: 2.0),
      ),
    );
  }

  factory Button.filled({
    Key? key,
    required String text,
    TextStyle? textStyle,
    VoidCallback? onTap,
    double? radius,
    required Color color,
    required Color textColor,
  }) {
    final style = textStyle?.copyWith(color: textColor) ??
        Fonts.titleLarge.copyWith(color: textColor);

    return Button(
      key: key,
      text: text,
      onTap: onTap,
      textStyle: style,
      buttonStyle: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
              vertical: Sizes.size12, horizontal: Sizes.size24),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? Sizes.radius10),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.pressed)
              ? color.withAlpha(90)
              : color;
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size12, horizontal: Sizes.size24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.radius10)),
          ),
      onPressed: onTap,
      child: Text(
        text.toUpperCase(),
        style: textStyle ?? Fonts.titleLarge,
      ),
    );
  }
}
