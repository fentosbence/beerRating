import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/service/platform_service.dart';
import 'package:flutter/material.dart';

class AppHeaderIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final Color? color;

  const AppHeaderIcon({
    super.key,
    required this.onTap,
    this.iconData = Icons.arrow_back,
    this.color,
  });

  factory AppHeaderIcon.back({
    required VoidCallback onTap,
    Color? color,
  }) {
    return AppHeaderIcon(
      iconData: PlatformService.isAndroid
          ? Icons.arrow_back
          : Icons.arrow_back_ios_new_outlined,
      onTap: onTap,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kToolbarHeight),
      child: Material(
        color: ColorPalette.transparent,
        child: IconButton(
          iconSize: 20,
          icon: Icon(iconData),
          color: color,
          onPressed: onTap,
        ),
      ),
    );
  }
}
