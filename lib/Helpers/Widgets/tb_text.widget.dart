import 'package:flutter/material.dart';

class TBText extends StatelessWidget {
  const TBText(
    this.text, {
    this.maxLines = 1,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.textSize = 14,
    this.textScale = 1,
    super.key,
  });

  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextAlign textAlign;
  final double textScale;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      textScaler: TextScaler.linear(textScale),
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
