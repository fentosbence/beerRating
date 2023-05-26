import 'package:beer_app/app/theme/assets.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/repository/model/beer.dart';
import 'package:beer_app/widget/ripple.dart';
import 'package:beer_app/widget/separator.dart';

import 'package:flutter/material.dart';

import 'package:beer_app/widget/gaps.dart';

class DetailsContent extends StatelessWidget {
  final Beer beer;

  const DetailsContent({
    super.key,
    required this.beer,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Paddings.horizontal40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Vgap.size16(),
            Text(
              beer.name,
              style: Fonts.headlineMedium.bold,
            ),
            if (beer.description != null)
              Text(
                beer.description!,
                style: Fonts.bodyLarge,
              ),
            Vgap.size12(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "abv",
                      style: Fonts.bodyLarge.bold,
                    ),
                    Text(
                      '${beer.alcohol} %',
                      style: Fonts.titleLarge.yellow.bold,
                    ),
                  ],
                ),
                Hgap.size40(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ibu",
                      style: Fonts.bodyLarge.bold,
                    ),
                    Text(
                      '${beer.ibu} %',
                      style: Fonts.titleLarge.yellow.bold,
                    ),
                  ],
                ),
              ],
            ),
            Vgap.size8(),
            if (beer.ingredients != null) ...[
              Text(
                "Ingredients",
                style: Fonts.titleLarge.bold,
              ),
              Text(
                beer.ingredients.toString(),
                style: Fonts.bodyLarge,
              ),
            ],
            Vgap.size16(),
            Vgap.size16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Rate the beer",
                  style: Fonts.headlineSmall.bold,
                ),
                Separator(),
                const CircleAvatar(
                  backgroundColor: ColorPalette.black,
                  radius: 20,
                  child: Image(image: Assets.iconArrowDown),
                ),
                Hgap.size4(),
                const Text('123'),
                Hgap.size4(),
                Ripple(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: ColorPalette.black,
                    radius: 20,
                    child: Image(image: Assets.iconArrowUp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
            ),
            Vgap.systemNavbar(context),
          ],
        ),
      ),
    );
  }
}
