import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/core/provider/ui_handler.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'error/error_display.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final UiHandler uiHandler;
  final PreferredSizeWidget? appBar;
  final List<Widget> overlays;
  final bool extendBodyBehindAppBar;
  final Color backgroundColor;

  const AppScaffold({
    super.key,
    required this.uiHandler,
    required this.body,
    this.appBar,
    this.overlays = const [],
    this.backgroundColor = ColorPalette.white,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => uiHandler),
      ],
      child: Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        body: Stack(
          children: [
            body,
            ...overlays,
            const ErrorDisplay(),
          ],
        ),
      ),
    );
  }
}
