import 'package:flutter/material.dart';

double calculateTextWidth(String text, TextStyle style) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    maxLines: 1,
  );
  textPainter.layout();
  return textPainter.width;
}

double calculateTextHeight(String text, TextStyle style,
    {int maxLines = 1, double maxWidth = double.infinity}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    maxLines: maxLines,
  );
  textPainter.layout(maxWidth: maxWidth);
  return textPainter.height;
}
