import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/theme/sizes.dart';
import '../../repository/model/beer.dart';
import '../../widget/slivers.dart';
import 'details_content.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Beer? beer;

  @override
  Widget build(BuildContext context) {
    beer = context.watch<BeerProvider>().findById(widget.id);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPersistentHeader(
          //   delegate: DetailsSliverHeaderDelegate.from(
          //     context,
          //     beer.imageUrl,
          //   ),
          //   pinned: true,
          // ),
          (beer != null)
              ? SliverChild(
                  child: DetailsContent(
                    beer: beer!,
                  ),
                )
              : const SliverChild(
                  child: Center(
                    child: Padding(
                      padding: Paddings.all16,
                      child: Text(
                        "A részletes oldal nem elérhető",
                        style: Fonts.bodyMedium,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
