import 'package:beer_app/core/display.dart';
import 'package:beer_app/core/error/modal_error.dart';
import 'package:beer_app/core/provider/ui_handler.dart';
import 'package:beer_app/widget/dialog/dialog_container.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uiHandler = context.watch<UiHandler>();
    return Display.single(
      notifier: uiHandler,
      condition: () => uiHandler.hasError,
      displayTypeCondition: () {
        return DisplayType.fade;
      },
      builder: (_, __) {
        final error = uiHandler.currentError!;

        return DialogContainer(
          child: ModalError(
            error: error,
            onDismiss: () {
              uiHandler.clearError();
            },
          ),
        );
      },
    );
  }
}
