import 'package:flutter/material.dart';

class PsTextStyle {
  static const String fontFamily = "Montserrat";

  static TextStyle titleH1(Color color) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle titleH2(Color color) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: fontFamily,
    );
  }

    static TextStyle bigRegular(Color color) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle subTitle(Color color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle regular(Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

    static TextStyle regularDold(Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle defaultFont(Color color) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle smallRegular(Color color) {
    return TextStyle(
      fontSize: 12,
      color: color,
      fontFamily: fontFamily,
    );
  }
}
