import 'package:beer_app/core/display.dart';
import 'package:beer_app/core/error/app_error.dart';
import 'package:beer_app/core/error/exceptions.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:beer_app/widget/button.dart';
import 'package:beer_app/widget/gaps.dart';
import 'package:flutter/material.dart';

class ModalError extends StatefulWidget {
  final AppError error;
  final VoidCallback onDismiss;

  const ModalError({
    super.key,
    required this.error,
    required this.onDismiss,
  });

  @override
  State<ModalError> createState() => _ModalErrorState();
}

class _ModalErrorState extends State<ModalError> {
  final _tapCount = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String title = l10n.error_oops_something_went_wrong;
    String message = l10n.error_try_again_later;
    String primaryText = context.l10n.common_alright;
    String? secondaryText;
    VoidCallback? primaryCallback, secondaryCallback;

    final source = widget.error.source;

    switch (source.runtimeType) {
      case NetworkException:
        message = l10n.error_no_network;
        primaryText = l10n.common_retry;
        secondaryText = l10n.common_cancel;
        primaryCallback = widget.error.retryResolver;
        secondaryCallback = widget.onDismiss;
        break;
      case ResponseException:
        title = l10n.error_oops;
        message = l10n.error_server;
        secondaryText = l10n.common_cancel;
        primaryCallback = widget.error.retryResolver;
        secondaryCallback = widget.onDismiss;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            _tapCount.value = ++_tapCount.value;
          },
          child: Icon(
            Icons.error_outline,
            color: context.theme.colorScheme.error,
            size: 40,
          ),
        ),
        Vgap.size8(),
        Text(
          title,
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        Vgap.size8(),
        Text(
          message,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Display.single(
          notifier: _tapCount,
          condition: () => _tapCount.value > 10,
          builder: (_, __) {
            return Column(
              children: [
                Vgap.size24(),
                if (source is ResponseException) ...[
                  Text(_getResponseExceptionMessage(source)),
                ] else ...[
                  Text(source.toString()),
                ]
              ],
            );
          },
        ),
        Vgap.size24(),
        Button(
          text: primaryText,
          onTap: () {
            primaryCallback?.call();
            widget.onDismiss.call();
          },
        ),
        if (secondaryText != null) ...[
          Vgap.size8(),
          Button(
            text: secondaryText,
            onTap: () {
              secondaryCallback?.call();
            },
          ),
        ],
      ],
    );
  }

  String _getResponseExceptionMessage(ResponseException e) {
    final sb = StringBuffer();
    sb.writeln("${e.method} ${e.path}\n");
    if (e.statusCode != null) {
      sb.writeln("HTTP status: ${e.statusCode}\n");
    }
    sb.writeln(e.message);
    return sb.toString();
  }
}
