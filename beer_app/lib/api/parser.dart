typedef Mapper<T> = T Function(dynamic json);

class Parser {
  Parser._();

  static List<T> parseList<T>(dynamic value, Mapper<T> mapper) {
    if (value is List) {
      if (value.isEmpty) {
        return [];
      }
      return value.map(mapper).toList();
    } else {
      return [];
    }
  }

  static List<T> parseUpdateList<T>(dynamic values, Mapper<T> mapper) {
    if (values is List) {
      if (values.isEmpty) {
        return [];
      }
      return values.map(mapper).toList();
    } else {
      return [];
    }
  }

  static double? doubleFromJson(String? json) =>
      json != null ? double.parse(json) : null;
}
