import 'package:flutter/material.dart';

class ColorMood {
  final Color subtle;
  final Color moderate;
  final Color intense;
  final Color normal;
  final Color muted;
  final Color disabled;
  final Color onSubtle;
  final Color onIntense;
  final Color defaultColor;
  final Color faded;
  final Color fadedHighlighted;
  final Color highlighted;
  final Color transparent;

  const ColorMood({
    this.subtle = Colors.black,
    this.moderate = Colors.black,
    this.intense = Colors.black,
    this.normal = Colors.black,
    this.muted = Colors.black,
    this.disabled = Colors.black,
    this.onSubtle = Colors.black,
    this.onIntense = Colors.black,
    this.defaultColor = Colors.black,
    this.faded = Colors.black,
    this.fadedHighlighted = Colors.black,
    this.highlighted = Colors.black,
    this.transparent = Colors.black,
  });

  static ColorMood lerp(ColorMood a, ColorMood b, double t) {
    return ColorMood(
      subtle: Color.lerp(a.subtle, b.subtle, t)!,
      moderate: Color.lerp(a.moderate, b.moderate, t)!,
      intense: Color.lerp(a.intense, b.intense, t)!,
      normal: Color.lerp(a.normal, b.normal, t)!,
      muted: Color.lerp(a.muted, b.muted, t)!,
      disabled: Color.lerp(a.disabled, b.disabled, t)!,
      onSubtle: Color.lerp(a.onSubtle, b.onSubtle, t)!,
      onIntense: Color.lerp(a.onIntense, b.onIntense, t)!,
      defaultColor: Color.lerp(a.defaultColor, b.defaultColor, t)!,
      faded: Color.lerp(a.faded, b.faded, t)!,
      fadedHighlighted: Color.lerp(a.fadedHighlighted, b.fadedHighlighted, t)!,
      highlighted: Color.lerp(a.highlighted, b.highlighted, t)!,
      transparent: Color.lerp(a.transparent, b.transparent, t)!,
    );
  }
}
