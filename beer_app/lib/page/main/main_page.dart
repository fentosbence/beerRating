import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/page/main/beer_list_item.dart';
import 'package:beer_app/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/gaps.dart';
import '../../widget/separator.dart';
import '../../widget/slivers.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //final _model = IoC.get<MainModel>();

  @override
  Widget build(BuildContext context) {
    final beers = Provider.of<BeerProvider>(context);

    return Scaffold(
      body: Padding(
        padding: Paddings.horizontal40,
        child: CustomScrollView(
          slivers: [
            // SliverPersistentHeader(
            //   delegate: SliverHeaderDelegate(context),
            //   pinned: true,
            // ),
            SliverListBuilder(
              childCount: beers.beers?.length ?? 0,
              separator: const Separator(),
              itemBuilder: (BuildContext context, int index) {
                return BeerListItem(
                  beer: beers.beers![index],
                );
              },
            ),
            SliverChildren(
              children: [
                Button(text: "See 5 best beers", onTap: () {}),
                Vgap.systemNavbar(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
