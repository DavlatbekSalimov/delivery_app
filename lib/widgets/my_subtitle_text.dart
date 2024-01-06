import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySubtitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool? centertext;
  const MySubtitleText({
    super.key,
    required this.text,
    this.fontSize,
    this.centertext,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: fontSize ?? 15,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFA7A9B7),
        ),
      ),
      textAlign: centertext == true ? TextAlign.center : TextAlign.left,
    );
  }
}
