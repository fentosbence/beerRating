import 'package:beer_app/app/theme/durations.dart';
import 'package:flutter/material.dart';

enum DisplayType {
  fade,
  slideUp,
}

final _slideUpTween = Tween<Offset>(
  begin: const Offset(0, 1),
  end: const Offset(0, 0),
);

typedef DisplayCondition = bool Function();
typedef DisplayTypeCondition = DisplayType Function();

class Display<T> extends StatefulWidget {
  final Listenable listenable;
  final TransitionBuilder builder;
  final DisplayCondition? condition;
  final Widget? child;
  final Widget placeholder;
  final DisplayTypeCondition? displayTypeCondition;
  final Duration enterDuration, exitDuration;

  const Display._({
    super.key,
    required this.listenable,
    required this.builder,
    this.condition,
    this.displayTypeCondition,
    this.enterDuration = Durations.longEnter,
    this.exitDuration = Durations.longExit,
    this.child,
    this.placeholder = const SizedBox(),
  });

  factory Display.multi({
    required List<ChangeNotifier> notifiers,
    required TransitionBuilder builder,
    DisplayCondition? condition,
    DisplayTypeCondition? displayTypeCondition,
    Widget? child,
  }) {
    return Display._(
      listenable: Listenable.merge(notifiers.map((c) => c).toList()),
      condition: condition,
      builder: builder,
      displayTypeCondition: displayTypeCondition,
      child: child,
    );
  }

  factory Display.single({
    required ChangeNotifier notifier,
    required TransitionBuilder builder,
    DisplayCondition? condition,
    DisplayTypeCondition? displayTypeCondition,
    Widget? child,
    Widget placeholder = const SizedBox(),
    Duration enterDuration = Durations.longEnter,
    Duration exitDuration = Durations.longExit,
  }) {
    return Display._(
      listenable: notifier,
      condition: condition,
      displayTypeCondition: displayTypeCondition,
      builder: builder,
      placeholder: placeholder,
      enterDuration: enterDuration,
      exitDuration: exitDuration,
      child: child,
    );
  }

  @override
  State<Display<T>> createState() => _DisplayState<T>();
}

class _DisplayState<T> extends State<Display<T>> {
  DisplayType _type = DisplayType.fade;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.listenable,
      builder: (context, child) {
        Widget target = widget.placeholder;
        final shouldBuild = widget.condition?.call() ?? true;
        if (shouldBuild) {
          _type = widget.displayTypeCondition?.call() ?? DisplayType.fade;
          target = widget.builder(context, child);
        }

        return AnimatedSwitcher(
          duration: widget.enterDuration,
          reverseDuration: widget.exitDuration,
          switchInCurve: Durations.standardCurve,
          transitionBuilder: (child, animation) {
            if (_type == DisplayType.slideUp) {
              return SlideTransition(
                position: _slideUpTween.animate(animation),
                child: child,
              );
            } else {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
          },
          child: target,
        );
      },
      child: widget.child,
    );
  }
}
