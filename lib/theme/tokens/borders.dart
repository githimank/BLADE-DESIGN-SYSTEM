import 'package:flutter/material.dart';

class Borders {
  Borders._();

  static const Radii radii = Radii._();
  static const Widths widths = Widths._();
}

class Radii {
  const Radii._();

  final BorderRadius none = const BorderRadius.all(Radius.circular(0));
  final BorderRadius xSmall = const BorderRadius.all(Radius.circular(1));
  final BorderRadius small = const BorderRadius.all(Radius.circular(2));
  final BorderRadius medium = const BorderRadius.all(Radius.circular(4));
  final BorderRadius large = const BorderRadius.all(Radius.circular(8));
  final BorderRadius xLarge = const BorderRadius.all(Radius.circular(12));
  final BorderRadius xxLarge = const BorderRadius.all(Radius.circular(16));
  final BorderRadius max = const BorderRadius.all(Radius.circular(1000));
// static const BorderRadiusGeometry round = BorderRadius.all(Radius.circular(16));
}

class Widths {
  const Widths._();

  final double none = 0;
  final double thinner = 0.5;
  final double thin = 1;
  final double thick = 1.5;
  final double thicker = 2;
}
