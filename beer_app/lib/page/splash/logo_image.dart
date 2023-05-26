import 'package:beer_app/app/theme/assets.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../app/theme/sizes.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenWidth / 2.5;

    final radius = BorderRadius.circular(Sizes.radius10);

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        color: ColorPalette.yellow,
        boxShadow: const [
          BoxShadow(
            color: ColorPalette.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: Paddings.all8,
      child: ClipRRect(
        borderRadius: radius,
        child: Image(
          image: Assets.imgLogo,
          width: size,
          height: size,
          fit: BoxFit.cover,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
