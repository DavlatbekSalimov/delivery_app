import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const MyTitleText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: fontSize ?? 25,
          fontWeight: fontWeight ?? FontWeight.w800,
          color: color,
        ),
      ),
    );
  }
}
