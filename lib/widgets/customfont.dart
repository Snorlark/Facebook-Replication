import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  const CustomFont(
      {super.key,
      required this.text,
      this.fontSize = 15,
      this.color = Colors.black,
      this.fontFamily = 'Frutiger',
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left,
      this.letterSpacing = 0,
      this.fontStyle = FontStyle.normal});

  final String text;
  final double fontSize, letterSpacing;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );
  }
}
