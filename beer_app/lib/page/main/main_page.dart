import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/app/theme/theme.dart';
import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/page/main/beer_list_item.dart';
import 'package:beer_app/page/main/sliver_header_delegate.dart';
import 'package:beer_app/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.getSystemTheme(
        systemNavigationBarColor: ColorPalette.transparent,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate.from(context, "List of beers"),
              pinned: true,
            ),
            SliverListBuilder(
              padding: Paddings.horizontal40,
              childCount: beers.beers?.length ?? 0,
              separator: const Separator(),
              itemBuilder: (BuildContext context, int index) {
                return BeerListItem(
                  beer: beers.beers![index],
                );
              },
            ),
            SliverChildren(
              padding: Paddings.all16,
              children: [
                Button.primary(text: "See 5 best beers", onTap: () {}),
                Vgap.size16(),
                Button.filled(
                  text: "See worst 5 beers",
                  color: ColorPalette.yellow,
                  textColor: ColorPalette.black,
                  onTap: () {},
                ),
                Vgap.systemNavbar(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
