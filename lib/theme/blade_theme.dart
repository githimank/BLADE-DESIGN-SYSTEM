import 'package:blade_design_system/theme/theme.dart';
import 'package:blade_design_system/theme/tokens/font_letter_spacing.dart';
import 'package:blade_design_system/theme/tokens/font_line_height.dart';
import 'package:blade_design_system/theme/tokens/font_size_scale.dart';
import 'package:blade_design_system/theme/tokens/font_weights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Breakpoint {
  XS,
  S,
  M,
  L,
  XL;
}

class BladeTheme {
  static Breakpoint currentBreakpoint = Breakpoint.L;

  static FontSizeScale fontSizes = FontSizeScale.mobileScale;
  static FontWeightsScale fontWeights = FontWeightsScale.mobileScale;
  static LineHeightScale lineHeight = LineHeightScale.mobileScale;
  static LetterSpacingScale letterSpacing = LetterSpacingScale.mobileScale;

  // static AppTextTheme get appTextTheme {
  //   return switch (currentBreakpoint) {
  //     Breakpoint.XS => SmallScreenTypographyImpl(),
  //     Breakpoint.S => SmallScreenTypographyImpl(),
  //     Breakpoint.M => LargeScreenTypographyImpl(),
  //     Breakpoint.L => LargeScreenTypographyImpl(),
  //     Breakpoint.XL => LargeScreenTypographyImpl(),
  //   }
  //       .appTextTheme;
  // }

  static void initialize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 479) {
      currentBreakpoint = Breakpoint.XS;
      fontSizes = FontSizeScale.mobileScale;
      fontWeights = FontWeightsScale.mobileScale;
      lineHeight = LineHeightScale.mobileScale;
      letterSpacing = LetterSpacingScale.mobileScale;
    } else if (size.width < 767) {
      currentBreakpoint = Breakpoint.S;
      fontSizes = FontSizeScale.mobileScale;
      fontWeights = FontWeightsScale.mobileScale;
      lineHeight = LineHeightScale.mobileScale;
      letterSpacing = LetterSpacingScale.mobileScale;
    } else if (size.width < 1023) {
      currentBreakpoint = Breakpoint.M;
      fontSizes = FontSizeScale.desktopScale;
      fontWeights = FontWeightsScale.desktopScale;
      lineHeight = LineHeightScale.desktopScale;
      letterSpacing = LetterSpacingScale.desktopScale;
    } else if (size.width < 1199) {
      currentBreakpoint = Breakpoint.L;
      fontSizes = FontSizeScale.desktopScale;
      fontWeights = FontWeightsScale.desktopScale;
      lineHeight = LineHeightScale.desktopScale;
      letterSpacing = LetterSpacingScale.desktopScale;
    } else {
      currentBreakpoint = Breakpoint.XL;
      fontSizes = FontSizeScale.desktopScale;
      fontWeights = FontWeightsScale.desktopScale;
      lineHeight = LineHeightScale.desktopScale;
      letterSpacing = LetterSpacingScale.desktopScale;
    }
  }
}
