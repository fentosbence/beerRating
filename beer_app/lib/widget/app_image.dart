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

  const AppImage({
    Key? key,
    this.url,
    this.width = 112,
    this.height = 134,
    this.fit = BoxFit.contain,
    this.useOldImageOnUrlChange = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return _buildPlaceholder(context, "");
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: ColorPalette.yellow,
          borderRadius: BorderRadius.circular(Sizes.radius10)),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: url!,
          width: 27,
          height: 107,
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
