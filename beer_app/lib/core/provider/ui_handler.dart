import 'package:beer_app/core/error/app_error.dart';
import 'package:flutter/foundation.dart';

class UiHandler extends ChangeNotifier {
  bool _loading = false;
  AppError? _error;

  UiHandler();

  bool get isLoading => _loading;
  bool get hasError => currentError != null;
  AppError? get currentError => _error;

  void setLoading() {
    _loading = true;
    clearError();
    notifyListeners();
  }

  void clearLoading() {
    _loading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void setError(
    dynamic e, {
    ErrorResolver? retryCallback,
    ErrorResolver? primaryCallback,
    ErrorResolver? secondaryCallback,
  }) {
    clearLoading();
    _error = AppError(
      e,
      retryCallback,
      primaryCallback,
      secondaryCallback,
    );
    notifyListeners();
  }
}
