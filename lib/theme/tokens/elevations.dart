import 'package:flutter/material.dart';

class Elevations {
  static const none = <BoxShadow>[];

  static final lowRaised = [
    BoxShadow(
      color: const HSLColor.fromAHSL(0.10, 217, 0.56, 0.17).toColor(),
      offset: const Offset(0, 2),
      blurRadius: 16,
      spreadRadius: 0,
    )
  ];

  static final midRaised = [
    BoxShadow(
      color: const HSLColor.fromAHSL(0.12, 217, 0.56, 0.17).toColor(),
      offset: const Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
    )
  ];

  static final highRaised = [
    BoxShadow(
      color: const HSLColor.fromAHSL(0.18, 217, 0.56, 0.17).toColor(),
      offset: const Offset(0, 16),
      blurRadius: 48,
      spreadRadius: -4,
    )
  ];
}
