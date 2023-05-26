import 'package:beer_app/app/ioc.dart';
import 'package:beer_app/app/theme/assets.dart';
import 'package:beer_app/app/theme/color_palette.dart';
import 'package:beer_app/app/theme/fonts.dart';
import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/core/display.dart';
import 'package:beer_app/core/provider/category_provider.dart';
import 'package:beer_app/page/main/main_model.dart';
import 'package:beer_app/widget/button.dart';
import 'package:beer_app/widget/ripple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryProvider>();
    final itemCount = categories.types?.length ?? 0;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, i) {
          final left = i == 0 ? Sizes.size16 : Sizes.size4;
          final right = i == itemCount - 1 ? Sizes.size16 : Sizes.size12;

          return Container(
            height: 32,
            margin: EdgeInsets.fromLTRB(
              left,
              0,
              right,
              0,
            ),
            child: builder(context, i),
          );
        },
      ),
    );
  }

  Widget builder(BuildContext context, int i) {
    final model = IoC.get<MainModel>();
    final categories = context.watch<CategoryProvider>();
    final selected = categories.types![i];
    if (selected.name == categories.active?.name) {
      return Ripple(
        onTap: () {
          categories.deselect();
          model.searchByType(null);
        },
        child: Stack(
          children: [
            Button.filled(
              text: categories.active!.name,
              color: ColorPalette.yellow,
              textStyle: Fonts.titleMedium,
              radius: Sizes.radius28,
              textColor: ColorPalette.white,
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: ColorPalette.white,
                radius: 19.0 / 2.0,
                child: Image(image: Assets.iconCancel),
              ),
            ),
          ],
        ),
      );
    } else {
      return Button.primary(
        text: selected.name,
        style: Fonts.titleMedium,
        radius: Sizes.radius28,
        onTap: () {
          categories.selectType(categories.types![i]);

          model.searchByType(selected);
        },
      );
    }
  }
}
