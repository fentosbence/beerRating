import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/core/app_scaffold.dart';
import 'package:beer_app/core/provider/ui_handler.dart';
import 'package:beer_app/page/splash/logo_image.dart';
import 'package:beer_app/page/splash/splash_model.dart';
import 'package:beer_app/widget/gaps.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final _model = IoC.get<SplashModel>();

  @override
  void initState() {
    super.initState();
    _model.loadAppContent();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      uiHandler: _model.uiHandler,
      backgroundColor: ColorPalette.white,
      body: Center(
        child: Column(
          children: [
            Vgap.systemStatusBar(context),
            const Spacer(),
            const LogoImage(),
            Vgap.size40(),
            Text(
              "BeerApp",
              textAlign: TextAlign.center,
              style: Fonts.titleLarge.bold,
            ),
            const Spacer(),
            Vgap.systemNavbar(context),
          ],
        ),
      ),
    );
  }
}
