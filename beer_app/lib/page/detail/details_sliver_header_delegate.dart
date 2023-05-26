import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/durations.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:beer_app/widget/app_image.dart';
import 'package:beer_app/widget/gaps.dart';
import 'package:beer_app/widget/header/app_header_icon.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailsSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final bool showBackButton;
  final String title;
  final String? overlayerImageUrl;

  DetailsSliverHeaderDelegate._({
    required this.minHeight,
    required this.maxHeight,
    required this.title,
    this.showBackButton = false,
    this.overlayerImageUrl,
  });

  factory DetailsSliverHeaderDelegate.from(BuildContext context,
      {required bool showBackButton,
      required String title,
      String? overlayerImageUrl}) {
    final min = context.statusBarHeight + kToolbarHeight;
    final max = math.min(450.0, context.screenHeight * 0.4);
    return DetailsSliverHeaderDelegate._(
      minHeight: min,
      maxHeight: max,
      title: title,
      showBackButton: showBackButton,
      overlayerImageUrl: overlayerImageUrl,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final ratio = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final headerHeight =
        Tween(begin: maxExtent, end: minExtent).transform(ratio);

    final progressBottomEnd = (kToolbarHeight - _progressSizeTween.end!) / 2.0;
    Tween<double> imageHeightTween =
        Tween(begin: maxExtent - 167, end: minHeight - context.statusBarHeight);
    final imageHeight = imageHeightTween.transform(ratio);
    Tween<double> progressBottomTween = Tween(
      begin: maxExtent - 167 + 36,
      end: progressBottomEnd,
    );
    final progressBottomMargin = progressBottomTween.transform(ratio);

    return SizedBox(
      height: headerHeight,
      width: double.maxFinite,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: math.max(headerHeight * 0.7, minExtent),
              width: double.maxFinite,
              decoration: _bgDecorationTween.transform(ratio),
            ),
          ),
          Positioned(
            bottom: progressBottomMargin,
            right: kToolbarHeight,
            left: kToolbarHeight,
            child: Transform.scale(
              scale: _textScaleTween.transform(ratio),
              alignment: Alignment.center,
              child: Text(
                title,
                style: Fonts.headlineLarge.bold
                    .copyWith(color: ColorPalette.white),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (showBackButton) ...[
            Positioned(
              top: context.statusBarHeight,
              left: 0,
              width: kToolbarHeight,
              height: kToolbarHeight,
              child: Center(
                child: AppHeaderIcon.back(
                  onTap: IoC.router.pop,
                  color: ColorPalette.white,
                ),
              ),
            ),
          ],
          if (overlayerImageUrl != null) ...[
            Positioned(
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: ratio > 0.7 ? 0.0 : 1.0,
                  duration: Durations.mediumEnter,
                  child: AppImage(
                    fit: BoxFit.contain,
                    height: imageHeight,
                    url: overlayerImageUrl,
                    backgroundColor: ColorPalette.transparent,
                  ),
                ))
          ]
        ],
      ),
    );
  }

  static final _progressSizeTween = Tween(begin: 50.0, end: 40.0);
  static final _textScaleTween = Tween(begin: 1.0, end: 0.7);
  static final _bgDecorationTween = DecorationTween(
    begin: const BoxDecoration(
      borderRadius: _roundedBottomBorderRadius,
      color: ColorPalette.yellow,
      boxShadow: [],
    ),
    end: const BoxDecoration(
      color: ColorPalette.yellow,
      borderRadius: BorderRadius.zero,
      boxShadow: [
        BoxShadow(
          color: ColorPalette.shadow,
          blurRadius: 12,
          offset: Offset(0, 4),
        )
      ],
    ),
  );
  static const _roundedBottomBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(Sizes.radius20),
    bottomRight: Radius.circular(Sizes.radius20),
  );
}
