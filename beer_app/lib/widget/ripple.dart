import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final Color backgroundColor;
  final Color? splashColor;
  final double radiusSize;

  const Ripple({
    super.key,
    this.onTap,
    this.child,
    this.backgroundColor = ColorPalette.transparent,
    this.splashColor,
    this.radiusSize = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final color = splashColor ?? context.theme.colorScheme.surfaceVariant;
    final radius = BorderRadius.circular(radiusSize);
    return ClipRRect(
      borderRadius: radius,
      child: Material(
        color: backgroundColor,
        child: InkWell(
          splashColor: color.withOpacity(0.22),
          highlightColor: color.withOpacity(0.12),
          borderRadius: radius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
