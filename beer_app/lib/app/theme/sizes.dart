import 'package:flutter/material.dart';

class Sizes {
  static const size2 = 2.0;
  static const size4 = 4.0;
  static const size8 = 8.0;
  static const size12 = 12.0;
  static const size16 = 16.0;
  static const size20 = 20.0;
  static const size24 = 24.0;
  static const size40 = 40.0;

  static const radius20 = 20.0;
  static const radius10 = 10.0;

  static const icon18 = 18.0;
  static const icon20 = 20.0;
  static const icon24 = 24.0;

  Sizes._();
}

class Paddings {
  static const horizontal4 = EdgeInsets.symmetric(horizontal: Sizes.size4);
  static const horizontal8 = EdgeInsets.symmetric(horizontal: Sizes.size8);
  static const horizontal16 = EdgeInsets.symmetric(horizontal: Sizes.size16);
  static const horizontal40 = EdgeInsets.symmetric(horizontal: Sizes.size16);

  static const vertical8 = EdgeInsets.symmetric(vertical: Sizes.size8);

  static const all8 = EdgeInsets.all(Sizes.size8);
  static const all16 = EdgeInsets.all(Sizes.size16);

  Paddings._();
}
