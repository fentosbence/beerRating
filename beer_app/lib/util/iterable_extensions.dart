import 'package:collection/collection.dart';

extension IterableExtension<E> on Iterable<E> {
  E firstOrThrow(Exception exception) {
    final item = firstOrNull;
    if (item == null) {
      throw exception;
    }
    return item;
  }

  E firstWhereOrThrow({
    required bool Function(E element) test,
    required Exception exception,
  }) {
    final item = firstWhereOrNull(test);
    if (item == null) {
      throw exception;
    }
    return item;
  }
}
