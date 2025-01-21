import 'package:blade_design_system/theme/custom_color_theme.dart';
import 'package:flutter/material.dart';

import 'color_styles.dart';

abstract interface class IColorTheme {
  ColorStyle get surface;
  ColorStyle get feedback;
  ColorStyle get interactive;
  OverlayColorStyle get overlay;
  PopupColorStyle get popup;
  Color get transparent;

  CustomColorTheme get colorTheme;
}
