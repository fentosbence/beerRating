import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/app/theme/assets.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/page/detail/details_model.dart';
import 'package:beer_app/repository/model/beer.dart';
import 'package:beer_app/widget/ripple.dart';

import 'package:flutter/material.dart';

import 'package:beer_app/widget/gaps.dart';

class DetailsContent extends StatefulWidget {
  final Beer beer;

  const DetailsContent({
    super.key,
    required this.beer,
  });

  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  final _model = IoC.get<DetailsModel>();

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
              widget.beer.name,
              style: Fonts.headlineMedium.bold,
            ),
            if (widget.beer.description != null)
              Text(
                widget.beer.description!,
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
                      '${widget.beer.alcohol} %',
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
                      '${widget.beer.ibu} %',
                      style: Fonts.titleLarge.yellow.bold,
                    ),
                  ],
                ),
              ],
            ),
            Vgap.size8(),
            if (widget.beer.ingredients != null) ...[
              Text(
                "Ingredients",
                style: Fonts.titleLarge.bold,
              ),
              Text(
                widget.beer.ingredients.toString(),
                style: Fonts.bodyLarge,
              ),
            ],
            Vgap.size40(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Rate the beer",
                  style: Fonts.headlineSmall.bold,
                ),
                const Spacer(),
                Ripple(
                  onTap: () {
                    _model.vote(widget.beer.id, widget.beer.rating - 1);
                  },
                  child: const CircleAvatar(
                    backgroundColor: ColorPalette.black,
                    radius: 20,
                    child: Image(image: Assets.iconArrowDown),
                  ),
                ),
                Hgap.size8(),
                Text(
                  "${widget.beer.rating}",
                  style: Fonts.titleLarge,
                ),
                Hgap.size8(),
                Ripple(
                  onTap: () {
                    _model.vote(widget.beer.id, widget.beer.rating + 1);
                  },
                  child: const CircleAvatar(
                    backgroundColor: ColorPalette.black,
                    radius: 20,
                    child: Image(image: Assets.iconArrowUp),
                  ),
                ),
              ],
            ),
            Vgap.size16(),
            //todo: törölni, a headar animáció tesztelés miatt van bent
            const SizedBox(
              height: 300,
            ),
            Vgap.systemNavbar(context),
          ],
        ),
      ),
    );
  }
}
