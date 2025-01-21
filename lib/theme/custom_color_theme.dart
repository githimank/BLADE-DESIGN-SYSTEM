import 'package:flutter/material.dart';

import 'colors/color_styles.dart';

class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  final ColorStyle surface;
  final ColorStyle feedback;
  final ColorStyle interactive;
  final OverlayColorStyle overlay;
  final PopupColorStyle popup;
  final Color transparent;

  CustomColorTheme(
      {required this.surface,
      required this.feedback,
      required this.interactive,
      required this.overlay,
      required this.popup,
      required this.transparent});

  @override
  ThemeExtension<CustomColorTheme> copyWith(
      {ColorStyle? surface,
      ColorStyle? feedback,
      ColorStyle? interactive,
      OverlayColorStyle? overlay,
      PopupColorStyle? popup,
      Color? transparent}) {
    return CustomColorTheme(
        surface: surface ?? this.surface,
        feedback: feedback ?? this.feedback,
        interactive: interactive ?? this.interactive,
        overlay: overlay ?? this.overlay,
        popup: popup ?? this.popup,
        transparent: transparent ?? this.transparent);
  }

  @override
  ThemeExtension<CustomColorTheme> lerp(
    covariant ThemeExtension<CustomColorTheme>? other,
    double t,
  ) {
    if (other is! CustomColorTheme) {
      return this;
    }

    return CustomColorTheme(
      surface: ColorStyle.lerp(surface, other.surface, t),
      feedback: ColorStyle.lerp(feedback, other.feedback, t),
      interactive: ColorStyle.lerp(interactive, other.interactive, t),
      overlay: OverlayColorStyle.lerp(overlay, other.overlay, t),
      popup: PopupColorStyle.lerp(popup, other.popup, t),
      transparent:
          Color.lerp(transparent, other.transparent, t) ?? Colors.transparent,
    );
  }
}
