import 'package:flutter/material.dart';

import 'package:beer_app/app/theme/color_palette.dart';

class Separator extends StatelessWidget {
  final double height, indent;

  const Separator({
    super.key,
    this.height = 1.0,
    this.indent = 0.0,
  });

  factory Separator.withPadding(double size) {
    return Separator(indent: size);
  }

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: ColorPalette.gray,
      indent: indent,
      endIndent: indent,
    );
  }
}
