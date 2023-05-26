import 'package:beer_app/app/theme/assets.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app/theme/color_palette.dart';
import '../app/theme/durations.dart';

class AppImage extends StatelessWidget {
  final String? url;
  final double? width, height;
  final BoxFit fit;
  final bool useOldImageOnUrlChange;
  final Color backgroundColor;

  const AppImage({
    Key? key,
    this.url,
    this.width = 112,
    this.height = 134,
    this.fit = BoxFit.contain,
    this.useOldImageOnUrlChange = true,
    this.backgroundColor = ColorPalette.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return _buildPlaceholder(context, "");
    }

    return Container(
      height: height,
      width: width,
      padding: Paddings.all8,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(Sizes.radius10)),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: url!,
          fit: fit,
          fadeInDuration: Durations.mediumEnter,
          fadeOutDuration: Durations.mediumExit,
          useOldImageOnUrlChange: useOldImageOnUrlChange,
          placeholderFadeInDuration: Durations.mediumEnter,
          placeholder: _buildPlaceholder,
          errorWidget: _buildError,
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, String url) {
    return Container(
      width: width,
      height: height,
      color: ColorPalette.yellow,
    );
  }

  Widget _buildError(BuildContext context, String url, dynamic error) {
    return Container(
      width: width,
      height: height,
      color: ColorPalette.yellow,
      child: const Center(
        child: Image(image: Assets.imgBeer),
      ),
    );
  }
}
