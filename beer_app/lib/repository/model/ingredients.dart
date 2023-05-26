import 'package:intl/intl.dart';

class Ingredients {
  List<Component> malt;
  List<Component> hops;
  String yeast;

  Ingredients({required this.malt, required this.hops, required this.yeast});

  @override
  String toString() {
    String s = "";
    for (var m in malt) {
      s += "${m.name} (${m.amount.toString()}), ";
    }
    for (var h in hops) {
      s += "${h.name} (${h.amount.toString()}), ";
    }
    s += yeast;
    return s;
  }
}

class Component {
  String name;
  Amount amount;

  Component(this.name, this.amount);
}

class Amount {
  final double value;
  final String unit;

  Amount(this.value, this.unit);

  @override
  String toString() {
    return "$value $unit";
  }
}
