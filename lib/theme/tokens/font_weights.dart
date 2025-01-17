import 'package:flutter/material.dart';

class GlobalFontWeights {
  static const FontWeight fw100 = FontWeight.w100;
  static const FontWeight fw200 = FontWeight.w200;
  static const FontWeight fw300 = FontWeight.w300;
  static const FontWeight fw400 = FontWeight.w400;
  static const FontWeight fw500 = FontWeight.w500;
  static const FontWeight fw600 = FontWeight.w600;
  static const FontWeight fw700 = FontWeight.w700;
  static const FontWeight fw800 = FontWeight.w800;
  static const FontWeight fw900 = FontWeight.w900;
}

class FontWeightsScale {
  final FontWeight fw400;
  final FontWeight fw500;
  final FontWeight fw600;
  final FontWeight fw700;

  FontWeightsScale._(
      {required this.fw400,
        required this.fw500,
        required this.fw600,
        required this.fw700});

  static FontWeightsScale desktopScale = FontWeightsScale._(
      fw400: GlobalFontWeights.fw400,
      fw500: GlobalFontWeights.fw500,
      fw600: GlobalFontWeights.fw600,
      fw700: GlobalFontWeights.fw700);
  static FontWeightsScale mobileScale = FontWeightsScale._(
      fw400: GlobalFontWeights.fw400,
      fw500: GlobalFontWeights.fw500,
      fw600: GlobalFontWeights.fw600,
      fw700: GlobalFontWeights.fw700);
}
