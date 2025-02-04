import 'package:blade_design_system/theme/blade_theme.dart';
import 'package:blade_design_system/theme/theme.dart';
import 'package:blade_design_system/theme/tokens/font_families.dart';
import 'package:flutter/material.dart';

import 'i_bp_typography.dart';

class SmallScreenTypographyImpl implements IBpTypography {
  @override
  TextStyle get displayXLarge => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs1100,
        height: BladeTheme.lineHeight.lh1100 / BladeTheme.fontSizes.fs1100,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls50,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get displayLarge => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs1000,
        height: BladeTheme.lineHeight.lh1000 / BladeTheme.fontSizes.fs1000,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls50,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs900,
        height: BladeTheme.lineHeight.lh900 / BladeTheme.fontSizes.fs900,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls50,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs800,
        height: BladeTheme.lineHeight.lh800 / BladeTheme.fontSizes.fs800,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls50,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get heading2XLarge => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs700,
        height: BladeTheme.lineHeight.lh700 / BladeTheme.fontSizes.fs700,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get headingXLarge => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs600,
        height: BladeTheme.lineHeight.lh600 / BladeTheme.fontSizes.fs600,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get headingLarge => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs500,
        height: BladeTheme.lineHeight.lh500 / BladeTheme.fontSizes.fs500,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get headingMedium => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs400,
        height: BladeTheme.lineHeight.lh400 / BladeTheme.fontSizes.fs400,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get headingSmall => TextStyle(
        fontFamily: FontFamilies.tasaOrbiterDisplay,
        fontSize: BladeTheme.fontSizes.fs300,
        height: BladeTheme.lineHeight.lh300 / BladeTheme.fontSizes.fs300,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontFamily: FontFamilies.inter,
        fontSize: BladeTheme.fontSizes.fs200,
        height: BladeTheme.lineHeight.lh200 / BladeTheme.fontSizes.fs200,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontFamily: FontFamilies.inter,
        fontSize: BladeTheme.fontSizes.fs100,
        height: BladeTheme.lineHeight.lh100 / BladeTheme.fontSizes.fs100,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontFamily: FontFamilies.inter,
        fontSize: BladeTheme.fontSizes.fs50,
        height: BladeTheme.lineHeight.lh75 / BladeTheme.fontSizes.fs50,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get bodyXSmall => TextStyle(
        fontFamily: FontFamilies.inter,
        fontSize: BladeTheme.fontSizes.fs25,
        height: BladeTheme.lineHeight.lh25 / BladeTheme.fontSizes.fs25,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get captionMedium => TextStyle(
        fontFamily: FontFamilies.inter,
        fontSize: BladeTheme.fontSizes.fs25,
        height: BladeTheme.lineHeight.lh50 / BladeTheme.fontSizes.fs25,
        fontWeight: FontWeight.w600,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get codeMedium => TextStyle(
        fontFamily: 'Menlo',
        fontSize: BladeTheme.fontSizes.fs50,
        height: BladeTheme.lineHeight.lh75 / BladeTheme.fontSizes.fs50,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  TextStyle get codeSmall => TextStyle(
        fontFamily: 'Menlo',
        fontSize: BladeTheme.fontSizes.fs25,
        height: BladeTheme.lineHeight.lh25 / BladeTheme.fontSizes.fs25,
        fontWeight: FontWeight.w400,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
      );

  @override
  AppTextTheme get appTextTheme => AppTextTheme(
      displayXLarge: displayXLarge,
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      heading2XLarge: heading2XLarge,
      headingXLarge: headingXLarge,
      headingLarge: headingLarge,
      headingMedium: headingMedium,
      headingSmall: headingSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      bodyXSmall: bodyXSmall,
      captionMedium: captionMedium,
      codeMedium: codeMedium,
      codeSmall: codeSmall,
      captionSmall: captionSmall);

  @override
  TextStyle get captionSmall => TextStyle(
        fontFamily: FontFamilies.inter,
        fontSize: BladeTheme.fontSizes.fs25,
        height: BladeTheme.lineHeight.lh50 / BladeTheme.fontSizes.fs25,
        fontWeight: FontWeight.w600,
        letterSpacing: BladeTheme.letterSpacing.ls100,
        decoration: TextDecoration.none,
        leadingDistribution: TextLeadingDistribution.even,
      );
}
