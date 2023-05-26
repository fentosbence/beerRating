import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:flutter/material.dart';

class Vgap extends StatelessWidget {
  final double size;

  const Vgap({super.key, this.size = Sizes.size16});

  factory Vgap.size2() => const Vgap(size: Sizes.size2);
  factory Vgap.size4() => const Vgap(size: Sizes.size4);
  factory Vgap.size8() => const Vgap(size: Sizes.size8);
  factory Vgap.size12() => const Vgap(size: Sizes.size12);
  factory Vgap.size16() => const Vgap(size: Sizes.size16);
  factory Vgap.size24() => const Vgap(size: Sizes.size24);
  factory Vgap.size40() => const Vgap(size: Sizes.size40);
  factory Vgap.appBar() => const Vgap(size: kToolbarHeight);
  factory Vgap.systemNavbar(BuildContext context) {
    return Vgap(size: context.bottomNavBarHeight);
  }
  factory Vgap.systemStatusBar(BuildContext context) {
    return Vgap(size: context.statusBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class Hgap extends StatelessWidget {
  final double size;

  const Hgap({super.key, this.size = Sizes.size16});

  factory Hgap.size2() => const Hgap(size: Sizes.size2);
  factory Hgap.size4() => const Hgap(size: Sizes.size4);
  factory Hgap.size8() => const Hgap(size: Sizes.size8);
  factory Hgap.size12() => const Hgap(size: Sizes.size12);
  factory Hgap.size16() => const Hgap(size: Sizes.size16);
  factory Hgap.size20() => const Hgap(size: Sizes.size20);
  factory Hgap.size40() => const Hgap(size: Sizes.size40);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
