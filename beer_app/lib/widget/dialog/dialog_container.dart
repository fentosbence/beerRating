import 'package:beer_app/app/theme/sizes.dart';
import 'package:beer_app/util/build_context_extension.dart';
import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;
  final bool ignoreTouches, barrierDismissAllowed;
  final VoidCallback? onDismiss;

  const DialogContainer({
    super.key,
    required this.child,
    this.ignoreTouches = false,
    this.barrierDismissAllowed = false,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: context.theme.colorScheme.scrim.withOpacity(0.7),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(Sizes.size40),
            padding: Paddings.all16,
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(Sizes.radius10),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
