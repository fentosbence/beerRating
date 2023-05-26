import 'package:beer_app/app/theme/assets.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:beer_app/widget/gaps.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final bool showBackButton;
  final String title;

  SliverHeaderDelegate._({
    required this.minHeight,
    required this.maxHeight,
    required this.title,
    this.showBackButton = false,
  });

  factory SliverHeaderDelegate.from(BuildContext context,
      {required bool showBackButton, required String title}) {
    final min = context.statusBarHeight + kToolbarHeight;
    final max = math.max(min, 167.0);
    return SliverHeaderDelegate._(
      minHeight: min,
      maxHeight: max,
      title: title,
      showBackButton: showBackButton,
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
    Tween<double> progressBottomTween = Tween(
      begin: 36,
      end: progressBottomEnd,
    );
    final progressBottomMargin = progressBottomTween.transform(ratio);

    return Container(
      height: headerHeight,
      width: double.maxFinite,
      decoration: _bgDecorationTween.transform(ratio),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            bottom: progressBottomMargin,
            child: Transform.scale(
              scale: _textScaleTween.transform(ratio),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Fonts.headlineLarge.bold
                        .copyWith(color: ColorPalette.white),
                    maxLines: 1,
                  ),
                  Hgap.size8(),
                  const Image(
                    image: Assets.imgBeer,
                    height: 32,
                    width: 32,
                  )
                ],
              ),
            ),
          ),
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
