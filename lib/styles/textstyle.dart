import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle header = interFont(const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ));
  static TextStyle body = interFont(const TextStyle(fontSize: 14));
  static TextStyle caption = interFont(const TextStyle(fontSize: 12));

  static TextStyle interFont(TextStyle textStyle) {
    return GoogleFonts.inter(textStyle: textStyle);
  }
}
