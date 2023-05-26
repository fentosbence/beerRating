import 'dart:math';

import 'package:flutter/material.dart';

class SliverListBuilder extends StatelessWidget {
  final EdgeInsets padding;
  final int childCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget separator;

  const SliverListBuilder({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.childCount,
    required this.itemBuilder,
    this.separator = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final int itemIndex = index ~/ 2;
            if (index.isEven) {
              return itemBuilder(context, itemIndex);
            } else {
              return separator;
            }
          },
          semanticIndexCallback: (Widget widget, int localIndex) {
            if (localIndex.isEven) {
              return localIndex ~/ 2;
            }
            return null;
          },
          childCount: max(0, childCount * 2 - 1),
        ),
      ),
    );
  }
}

class SliverChild extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const SliverChild({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SliverChildren(padding: padding, children: [child]);
  }
}

class SliverChildren extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;

  const SliverChildren({
    super.key,
    required this.children,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final content = SliverList(delegate: SliverChildListDelegate(children));
    return SliverPadding(padding: padding, sliver: content);
  }
}

class SliverFill extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;

  const SliverFill({
    super.key,
    this.child,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
