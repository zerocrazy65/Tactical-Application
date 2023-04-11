import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTheme {
  static const Color primaryColor = Color(0xff525656);
  static final TextStyle fontStyle = GoogleFonts.jura();

  static TextStyle headerText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26.0,
    color: primaryColor,
    fontFamily: fontStyle.fontFamily,
  );
  static TextStyle regularText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
    fontFamily: fontStyle.fontFamily,
  );
  static TextStyle miniText = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
    color: primaryColor,
    fontFamily: fontStyle.fontFamily,
  );
}

class ColorTheme {
  static const Color navColor = Color(0xfff0f0f0);
  static const Color whiteBgColor = Color(0xFFF3F5F9);
  static const Color bgGreenColor = Color(0xFF506C60);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black26;
  static const Color greyOpaColor = Color.fromRGBO(128, 128, 128, 0.6);
}
