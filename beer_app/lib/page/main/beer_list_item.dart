import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/widget/app_image.dart';
import 'package:beer_app/widget/button.dart';
import 'package:flutter/material.dart';

import '../../repository/model/beer.dart';
import '../../widget/gaps.dart';

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
                  Button(text: 'More info', onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
