import 'package:blade_design_system/responsive/typography/large_screen_typography.dart';
import 'package:blade_design_system/responsive/typography/small_screen_typography_impl.dart';
import 'package:blade_design_system/theme/tokens/font_letter_spacing.dart';
import 'package:blade_design_system/theme/tokens/font_line_height.dart';
import 'package:blade_design_system/theme/tokens/font_size_scale.dart';
import 'package:blade_design_system/theme/tokens/font_weights.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

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

  static AppTextTheme get appTextTheme {
    return switch (currentBreakpoint) {
      Breakpoint.XS => SmallScreenTypographyImpl(),
      Breakpoint.S => SmallScreenTypographyImpl(),
      Breakpoint.M => LargeScreenTypographyImpl(),
      Breakpoint.L => LargeScreenTypographyImpl(),
      Breakpoint.XL => LargeScreenTypographyImpl(),
    }
        .appTextTheme;
  }

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

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle displayXLarge;
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle heading2XLarge;
  final TextStyle headingXLarge;
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle headingSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle bodyXSmall;
  final TextStyle captionMedium;
  final TextStyle codeMedium;
  final TextStyle codeSmall;

  const AppTextTheme({
    required this.displayXLarge,
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.heading2XLarge,
    required this.headingXLarge,
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.bodyXSmall,
    required this.captionMedium,
    required this.codeMedium,
    required this.codeSmall,
  });

  // @override
  // ThemeExtension<AppTextTheme> copyWith({
  //   TextStyle? displayXLarge,
  // }) {
  //   return AppTextTheme(
  //     displayXLarge: displayXLarge ?? this.displayXLarge,
  //   );
  // }

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? displayXLarge,
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? heading2XLarge,
    TextStyle? headingXLarge,
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? headingSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? bodyXSmall,
    TextStyle? captionMedium,
    TextStyle? codeMedium,
    TextStyle? codeSmall,
  }) {
    return AppTextTheme(
      displayXLarge: displayXLarge ?? this.displayXLarge,
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      heading2XLarge: heading2XLarge ?? this.heading2XLarge,
      headingXLarge: headingXLarge ?? this.headingXLarge,
      headingLarge: headingLarge ?? this.headingLarge,
      headingMedium: headingMedium ?? this.headingMedium,
      headingSmall: headingSmall ?? this.headingSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      bodyXSmall: bodyXSmall ?? this.bodyXSmall,
      captionMedium: captionMedium ?? this.captionMedium,
      codeMedium: codeMedium ?? this.codeMedium,
      codeSmall: codeSmall ?? this.codeSmall,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme(
      displayXLarge: TextStyle.lerp(displayXLarge, other.displayXLarge, t) ??
          displayXLarge,
      displayLarge:
          TextStyle.lerp(displayLarge, other.displayLarge, t) ?? displayLarge,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t) ??
          displayMedium,
      displaySmall:
          TextStyle.lerp(displaySmall, other.displaySmall, t) ?? displaySmall,
      heading2XLarge: TextStyle.lerp(heading2XLarge, other.heading2XLarge, t) ??
          heading2XLarge,
      headingXLarge: TextStyle.lerp(headingXLarge, other.headingXLarge, t) ??
          headingXLarge,
      headingLarge:
          TextStyle.lerp(headingLarge, other.headingLarge, t) ?? headingLarge,
      headingMedium: TextStyle.lerp(headingMedium, other.headingMedium, t) ??
          headingMedium,
      headingSmall:
          TextStyle.lerp(headingSmall, other.headingSmall, t) ?? headingSmall,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t) ?? bodyLarge,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t) ?? bodyMedium,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t) ?? bodySmall,
      bodyXSmall: TextStyle.lerp(bodyXSmall, other.bodyXSmall, t) ?? bodyXSmall,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t) ??
          captionMedium,
      codeMedium: TextStyle.lerp(codeMedium, other.codeMedium, t) ?? codeMedium,
      codeSmall: TextStyle.lerp(codeSmall, other.codeSmall, t) ?? codeSmall,
    );
  }
}

class ExtendedColors extends ThemeExtension<ExtendedColors> {
  const ExtendedColors({
    required this.onSurfaceVariantLight,
    required this.onSurfaceLight,
    required this.surfaceContainerHighestLight,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.notice,
    required this.onNotice,
    required this.noticeContainer,
    required this.onNoticeContainer,
    required this.onSurfaceVariantMid,
    required this.outlineLow,
    required this.surfaceVariantLight,
    required this.outlineStrong,
    required this.surfaceVariantMid,
    required this.surfaceVariantDark,
  });

  final Color onSurfaceVariantLight;
  final Color onSurfaceLight;
  final Color surfaceContainerHighestLight;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color notice;
  final Color onNotice;
  final Color noticeContainer;
  final Color onNoticeContainer;
  final Color onSurfaceVariantMid;
  final Color outlineLow;
  final Color surfaceVariantLight;
  final Color outlineStrong;
  final Color surfaceVariantMid;
  final Color surfaceVariantDark;

  @override
  ThemeExtension<ExtendedColors> copyWith({
    Color? onSurfaceVariantLight,
    Color? onSurfaceLight,
    Color? surfaceContainerHighestLight,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? notice,
    Color? onNotice,
    Color? noticeContainer,
    Color? onNoticeContainer,
    Color? onSurfaceVariantMid,
    Color? outlineLow,
    Color? surfaceVariantLight,
    Color? outlineStrong,
    Color? surfaceVariantMid,
    Color? surfaceVariantDark,
  }) {
    return ExtendedColors(
      onSurfaceLight: onSurfaceLight ?? this.onSurfaceLight,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      notice: notice ?? this.notice,
      onNotice: onNotice ?? this.onNotice,
      noticeContainer: noticeContainer ?? this.noticeContainer,
      onNoticeContainer: onNoticeContainer ?? this.onNoticeContainer,
      onSurfaceVariantLight:
          onSurfaceVariantLight ?? this.onSurfaceVariantLight,
      surfaceContainerHighestLight:
          surfaceContainerHighestLight ?? this.surfaceContainerHighestLight,
      onSurfaceVariantMid: onSurfaceVariantMid ?? this.onSurfaceVariantMid,
      outlineLow: outlineLow ?? this.outlineLow,
      surfaceVariantLight: surfaceVariantLight ?? this.surfaceVariantLight,
      outlineStrong: outlineStrong ?? this.outlineStrong,
      surfaceVariantMid: surfaceVariantMid ?? this.surfaceVariantMid,
      surfaceVariantDark: surfaceVariantDark ?? this.surfaceVariantDark,
    );
  }

  @override
  ThemeExtension<ExtendedColors> lerp(
    covariant ThemeExtension<ExtendedColors>? other,
    double t,
  ) {
    if (other is! ExtendedColors) {
      return this;
    }
    return ExtendedColors(
      onSurfaceLight: Color.lerp(onSurfaceLight, other.onSurfaceLight, t) ??
          AppColors.darkThemeSuccessContainer,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t) ??
              AppColors.lightThemeOnSuccessContainer,
      success:
          Color.lerp(success, other.success, t) ?? AppColors.lightThemeSuccess,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t) ??
              AppColors.lightThemeSuccessContainer,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ??
          AppColors.lightThemeOnSuccess,
      onSurfaceVariantLight:
          Color.lerp(onSurfaceVariantLight, other.onSurfaceVariantLight, t) ??
              AppColors.lightThemeOnSurfaceVariantLight,
      surfaceContainerHighestLight: Color.lerp(
            surfaceContainerHighestLight,
            other.surfaceContainerHighestLight,
            t,
          ) ??
          AppColors.surfaceContainerHighestLight,
      onSurfaceVariantMid:
          Color.lerp(onSurfaceVariantMid, other.onSurfaceVariantMid, t) ??
              AppColors.lightThemeOnSurfaceVariantMid,
      outlineStrong: Color.lerp(outlineStrong, other.outlineStrong, t) ??
          AppColors.lightThemeOutlineStrong,
      outlineLow: Color.lerp(outlineLow, other.outlineLow, t) ??
          AppColors.darkThemeOutlineLow,
      onNoticeContainer:
          Color.lerp(onNoticeContainer, other.onNoticeContainer, t) ??
              AppColors.lightThemeOnNoticeContainer,
      notice: Color.lerp(notice, other.notice, t) ?? AppColors.lightThemeNotice,
      noticeContainer: Color.lerp(noticeContainer, other.noticeContainer, t) ??
          AppColors.lightThemeNoticeContainer,
      onNotice: Color.lerp(onNotice, other.onNotice, t) ??
          AppColors.lightThemeOnNotice,
      surfaceVariantLight:
          Color.lerp(surfaceVariantLight, other.surfaceVariantLight, t) ??
              AppColors.lightThemeSurfaceVariantLight,
      surfaceVariantMid:
          Color.lerp(surfaceVariantMid, other.surfaceVariantMid, t) ??
              AppColors.lightThemeSurfaceVariantMid,
      surfaceVariantDark:
          Color.lerp(surfaceVariantDark, other.surfaceVariantDark, t) ??
              AppColors.lightThemeSurfaceVariantDark,
    );
  }
}
