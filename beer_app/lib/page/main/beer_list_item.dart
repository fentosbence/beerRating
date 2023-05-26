import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/app/routing/routes.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/widget/app_image.dart';
import 'package:beer_app/widget/button.dart';
import 'package:flutter/material.dart';

import 'package:beer_app/repository/model/beer.dart';
import 'package:beer_app/widget/gaps.dart';

class BeerListItem extends StatelessWidget {
  final Beer beer;

  const BeerListItem({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 23.0,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            AppImage(url: beer.imageUrl),
            Hgap.size20(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name,
                    style: Fonts.titleLarge,
                  ),
                  if (beer.tagline != null)
                    Text(
                      beer.tagline!,
                      style: Fonts.titleMedium,
                    ),
                  Text(
                    '${beer.alcohol} %',
                    style: Fonts.titleLarge.yellow.bold,
                  ),
                  Button.filled(
                    text: 'More info',
                    textStyle: Fonts.titleSmall,
                    onTap: () {
                      IoC.router.push(AppRoute.details(beer.id));
                    },
                    color: ColorPalette.black,
                    textColor: ColorPalette.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
