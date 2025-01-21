import 'package:blade_design_system/theme/custom_color_theme.dart';
import 'package:blade_design_system/theme/tokens/colors.dart';
import 'package:flutter/material.dart';

import 'color_mood.dart';
import 'color_styles.dart';
import 'i_color_theme.dart';

class LightColorThemeImpl implements IColorTheme {
  @override
  ColorStyle get feedback => ColorStyle(
        background: ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emeraldA50,
            intense: GlobalColors.emerald600,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimsonA50,
            intense: GlobalColors.crimson600,
          ),
          notice: ColorMood(
            subtle: GlobalColors.ciderA50,
            intense: GlobalColors.cider600,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphireA50,
            intense: GlobalColors.sapphire600,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralLightA50,
            intense: GlobalColors.neutralLight1000,
          ),
        ),
        border: ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emeraldA100,
            intense: GlobalColors.emerald700,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimsonA100,
            intense: GlobalColors.crimson700,
          ),
          notice: ColorMood(
            subtle: GlobalColors.ciderA100,
            intense: GlobalColors.cider700,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphireA100,
            intense: GlobalColors.sapphire700,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralLightA100,
            intense: GlobalColors.neutralLight1100,
          ),
        ),
        text: const ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emerald100,
            intense: GlobalColors.emerald700,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimson100,
            intense: GlobalColors.crimson600,
          ),
          notice: ColorMood(
            subtle: GlobalColors.cider100,
            intense: GlobalColors.cider700,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphire100,
            intense: GlobalColors.sapphire700,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralLight500,
            intense: GlobalColors.neutralLight1100,
          ),
        ),
        icon: const ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emerald100,
            intense: GlobalColors.emerald700,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimson100,
            intense: GlobalColors.crimson600,
          ),
          notice: ColorMood(
            subtle: GlobalColors.cider100,
            intense: GlobalColors.cider700,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphire100,
            intense: GlobalColors.sapphire700,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralLight500,
            intense: GlobalColors.neutralLight1100,
          ),
        ),
      );

  @override
  ColorStyle get interactive => ColorStyle(
        background: ColorStyleType(
          positive: ColorMood(
            defaultColor: GlobalColors.emerald600,
            highlighted: GlobalColors.emerald700,
            disabled: GlobalColors.emeraldA50,
            faded: GlobalColors.emeraldA50,
            fadedHighlighted: GlobalColors.emeraldA100,
          ),
          negative: ColorMood(
            defaultColor: GlobalColors.crimson600,
            highlighted: GlobalColors.crimson700,
            disabled: GlobalColors.crimsonA50,
            faded: GlobalColors.crimsonA50,
            fadedHighlighted: GlobalColors.crimsonA100,
          ),
          notice: ColorMood(
            defaultColor: GlobalColors.cider600,
            highlighted: GlobalColors.cider700,
            disabled: GlobalColors.ciderA50,
            faded: GlobalColors.ciderA50,
            fadedHighlighted: GlobalColors.ciderA100,
          ),
          information: ColorMood(
            defaultColor: GlobalColors.sapphire600,
            highlighted: GlobalColors.sapphire700,
            disabled: GlobalColors.sapphireA50,
            faded: GlobalColors.sapphireA50,
            fadedHighlighted: GlobalColors.sapphireA100,
          ),
          neutral: ColorMood(
            defaultColor: GlobalColors.neutralLight1000,
            highlighted: GlobalColors.neutralLight1100,
            disabled: GlobalColors.neutralLightA100,
            faded: GlobalColors.neutralLightA100,
            fadedHighlighted: GlobalColors.neutralLightA200,
          ),
          gray: ColorMood(
            defaultColor: GlobalColors.neutralLightA75,
            highlighted: GlobalColors.neutralLightA100,
            disabled: GlobalColors.neutralLightA50,
            faded: GlobalColors.neutralLightA25,
            fadedHighlighted: GlobalColors.neutralLightA75,
          ),
          primary: ColorMood(
            defaultColor: GlobalColors.velvora500,
            highlighted: GlobalColors.velvora600,
            disabled: GlobalColors.velvoraA50,
            faded: GlobalColors.velvoraA50,
            fadedHighlighted: GlobalColors.velvoraA100,
          ),
          staticBlack: ColorMood(
            defaultColor: GlobalColors.black,
            highlighted: GlobalColors.black,
            disabled: GlobalColors.black.withOpacity(0.56),
            faded: GlobalColors.black.withOpacity(0.18),
            fadedHighlighted: GlobalColors.black.withOpacity(0.32),
          ),
          staticWhite: ColorMood(
            defaultColor: GlobalColors.white,
            highlighted: GlobalColors.white.withOpacity(0.80),
            disabled: GlobalColors.white.withOpacity(0.18),
            faded: GlobalColors.white.withOpacity(0.18),
            fadedHighlighted: GlobalColors.white.withOpacity(0.32),
          ),
        ),
        border: ColorStyleType(
          positive: ColorMood(
            defaultColor: GlobalColors.emerald600,
            highlighted: GlobalColors.emerald700,
            disabled: GlobalColors.emeraldA100,
            faded: GlobalColors.emeraldA100,
          ),
          negative: ColorMood(
            defaultColor: GlobalColors.crimson600,
            highlighted: GlobalColors.crimson700,
            disabled: GlobalColors.crimsonA100,
            faded: GlobalColors.crimsonA100,
          ),
          notice: ColorMood(
            defaultColor: GlobalColors.cider600,
            highlighted: GlobalColors.cider700,
            disabled: GlobalColors.ciderA100,
            faded: GlobalColors.ciderA100,
          ),
          information: ColorMood(
            defaultColor: GlobalColors.sapphire600,
            highlighted: GlobalColors.sapphire700,
            disabled: GlobalColors.sapphireA100,
            faded: GlobalColors.sapphireA100,
          ),
          neutral: ColorMood(
            defaultColor: GlobalColors.neutralLight700,
            highlighted: GlobalColors.neutralLight700,
            disabled: GlobalColors.neutralLight300,
            faded: GlobalColors.neutralLightA100,
          ),
          gray: ColorMood(
            defaultColor: GlobalColors.neutralLight400,
            highlighted: GlobalColors.neutralLight400,
            disabled: GlobalColors.neutralLight200,
            faded: GlobalColors.neutralLightA100,
          ),
          primary: ColorMood(
            defaultColor: GlobalColors.velvora500,
            highlighted: GlobalColors.velvora500,
            disabled: GlobalColors.velvoraA100,
            faded: GlobalColors.velvoraA100,
          ),
          staticWhite: ColorMood(
            defaultColor: GlobalColors.white,
            highlighted: GlobalColors.white.withOpacity(0.8),
            disabled: GlobalColors.white.withOpacity(0.32),
            faded: GlobalColors.white.withOpacity(0.18),
          ),
          staticBlack: ColorMood(
            defaultColor: GlobalColors.black,
            highlighted: GlobalColors.black,
            disabled: GlobalColors.black.withOpacity(0.32),
            faded: GlobalColors.black.withOpacity(0.32),
          ),
        ),
        text: ColorStyleType(
          positive: ColorMood(
            normal: GlobalColors.emerald700,
            subtle: GlobalColors.emerald600,
            muted: GlobalColors.emerald400,
            disabled: GlobalColors.emeraldA200,
          ),
          negative: ColorMood(
            normal: GlobalColors.crimson600,
            subtle: GlobalColors.crimson500,
            muted: GlobalColors.crimson400,
            disabled: GlobalColors.crimsonA200,
          ),
          notice: ColorMood(
            normal: GlobalColors.cider700,
            subtle: GlobalColors.cider600,
            muted: GlobalColors.cider400,
            disabled: GlobalColors.ciderA200,
          ),
          information: ColorMood(
            normal: GlobalColors.sapphire700,
            subtle: GlobalColors.sapphire600,
            muted: GlobalColors.sapphire400,
            disabled: GlobalColors.sapphireA200,
          ),
          neutral: ColorMood(
            normal: GlobalColors.neutralLight1100,
            subtle: GlobalColors.neutralLight900,
            muted: GlobalColors.neutralLight600,
            disabled: GlobalColors.neutralLightA200,
          ),
          gray: ColorMood(
            normal: GlobalColors.neutralLight1200,
            subtle: GlobalColors.neutralLight900,
            muted: GlobalColors.neutralLight600,
            disabled: GlobalColors.neutralLightA200,
          ),
          primary: ColorMood(
            normal: GlobalColors.velvora600,
            subtle: GlobalColors.velvora500,
            muted: GlobalColors.velvora400,
            disabled: GlobalColors.velvoraA100,
          ),
          onPrimary: ColorMood(
            normal: GlobalColors.white,
            subtle: GlobalColors.white.withOpacity(0.8),
            muted: GlobalColors.white.withOpacity(0.64),
            disabled: GlobalColors.white.withOpacity(0.32),
          ),
          staticBlack: ColorMood(
            normal: GlobalColors.black,
            subtle: GlobalColors.black.withOpacity(0.8),
            muted: GlobalColors.black.withOpacity(0.72),
            disabled: GlobalColors.black.withOpacity(0.32),
          ),
          staticWhite: ColorMood(
            normal: GlobalColors.white,
            subtle: GlobalColors.white.withOpacity(0.8),
            muted: GlobalColors.white.withOpacity(0.64),
            disabled: GlobalColors.white.withOpacity(0.32),
          ),
        ),
        icon: ColorStyleType(
          positive: ColorMood(
            normal: GlobalColors.emerald700,
            subtle: GlobalColors.emerald600,
            muted: GlobalColors.emerald400,
            disabled: GlobalColors.emeraldA200,
          ),
          negative: ColorMood(
            normal: GlobalColors.crimson600,
            subtle: GlobalColors.crimson500,
            muted: GlobalColors.crimson400,
            disabled: GlobalColors.crimsonA200,
          ),
          notice: ColorMood(
            normal: GlobalColors.cider700,
            subtle: GlobalColors.cider600,
            muted: GlobalColors.cider400,
            disabled: GlobalColors.ciderA200,
          ),
          information: ColorMood(
            normal: GlobalColors.sapphire700,
            subtle: GlobalColors.sapphire600,
            muted: GlobalColors.sapphire400,
            disabled: GlobalColors.sapphireA200,
          ),
          neutral: ColorMood(
            normal: GlobalColors.neutralLight1100,
            subtle: GlobalColors.neutralLight900,
            muted: GlobalColors.neutralLight600,
            disabled: GlobalColors.neutralLightA200,
          ),
          gray: ColorMood(
            normal: GlobalColors.neutralLight1200,
            subtle: GlobalColors.neutralLight900,
            muted: GlobalColors.neutralLight600,
            disabled: GlobalColors.neutralLightA200,
          ),
          primary: ColorMood(
            normal: GlobalColors.velvora600,
            subtle: GlobalColors.velvora500,
            muted: GlobalColors.velvora400,
            disabled: GlobalColors.velvoraA100,
          ),
          onPrimary: ColorMood(
            normal: GlobalColors.white,
            subtle: GlobalColors.white.withOpacity(0.8),
            muted: GlobalColors.white.withOpacity(0.64),
            disabled: GlobalColors.white.withOpacity(0.32),
          ),
          staticBlack: ColorMood(
            normal: GlobalColors.black,
            subtle: GlobalColors.black.withOpacity(0.8),
            muted: GlobalColors.black.withOpacity(0.64),
            disabled: GlobalColors.black.withOpacity(0.32),
          ),
          staticWhite: ColorMood(
            normal: GlobalColors.white,
            subtle: GlobalColors.white.withOpacity(0.8),
            muted: GlobalColors.white.withOpacity(0.64),
            disabled: GlobalColors.white.withOpacity(0.32),
          ),
        ),
      );

  @override
  OverlayColorStyle get overlay => OverlayColorStyle(
        background: ColorMood(
          moderate: GlobalColors.neutralLightA200,
          subtle: GlobalColors.black.withOpacity(0.56),
        ),
      );

  @override
  PopupColorStyle get popup => PopupColorStyle(
        background: const ColorMood(
          subtle: GlobalColors.neutralLight000,
          intense: GlobalColors.neutralLight1000,
        ),
        border: ColorMood(
          subtle: GlobalColors.neutralLightA100,
          intense: GlobalColors.neutralLight900,
        ),
      );

  @override
  ColorStyle get surface => ColorStyle(
        background: ColorStyleType(
          gray: const ColorMood(
            subtle: GlobalColors.neutralLight100,
            moderate: GlobalColors.neutralLight050,
            intense: GlobalColors.neutralLight000,
          ),
          primary: ColorMood(
            subtle: GlobalColors.velvoraA50,
            intense: GlobalColors.velvora500,
          ),
          sea: const ColorMood(
            subtle: GlobalColors.sea050,
            intense: GlobalColors.sea800,
          ),
          cloud: const ColorMood(
            subtle: GlobalColors.cloud050,
            intense: GlobalColors.cloud800,
          ),
        ),
        border: ColorStyleType(
          gray: ColorMood(
            normal: GlobalColors.neutralLight500,
            subtle: GlobalColors.neutralLight300,
            muted: GlobalColors.neutralLightA100,
          ),
          primary: ColorMood(
            normal: GlobalColors.velvora500,
            muted: GlobalColors.velvoraA100,
          ),
        ),
        text: ColorStyleType(
          gray: ColorMood(
            normal: GlobalColors.neutralLight1200,
            subtle: GlobalColors.neutralLight900,
            muted: GlobalColors.neutralLight600,
            disabled: GlobalColors.neutralLightA200,
          ),
          primary: const ColorMood(
            normal: GlobalColors.velvora500,
          ),
          onSea: const ColorMood(
            onSubtle: GlobalColors.forest800,
            onIntense: GlobalColors.forest200,
          ),
          onCloud: const ColorMood(
            onSubtle: GlobalColors.velvora600,
            onIntense: GlobalColors.velvora200,
          ),
          staticWhite: ColorMood(
            normal: GlobalColors.white,
            subtle: GlobalColors.white.withOpacity(0.88),
            muted: GlobalColors.white.withOpacity(0.48),
            disabled: GlobalColors.white.withOpacity(0.32),
          ),
          staticBlack: ColorMood(
            normal: GlobalColors.black,
            subtle: GlobalColors.black.withOpacity(0.72),
            muted: GlobalColors.black.withOpacity(0.56),
            disabled: GlobalColors.black.withOpacity(0.32),
          ),
        ),
        icon: ColorStyleType(
          gray: ColorMood(
            normal: GlobalColors.neutralLight1200,
            subtle: GlobalColors.neutralLight900,
            muted: GlobalColors.neutralLight600,
            disabled: GlobalColors.neutralLightA200,
          ),
          primary: const ColorMood(
            normal: GlobalColors.velvora500,
          ),
          onSea: const ColorMood(
            onSubtle: GlobalColors.forest600,
            onIntense: GlobalColors.forest400,
          ),
          onCloud: const ColorMood(
            onSubtle: GlobalColors.velvora400,
            onIntense: GlobalColors.velvora300,
          ),
          staticWhite: ColorMood(
            normal: GlobalColors.white,
            subtle: GlobalColors.white.withOpacity(0.88),
            muted: GlobalColors.white.withOpacity(0.48),
            disabled: GlobalColors.white.withOpacity(0.32),
          ),
          staticBlack: ColorMood(
            normal: GlobalColors.black,
            subtle: GlobalColors.black.withOpacity(0.72),
            muted: GlobalColors.black.withOpacity(0.56),
            disabled: GlobalColors.black.withOpacity(0.32),
          ),
        ),
      );

  @override
  Color get transparent => Colors.transparent;

  @override
  CustomColorTheme get colorTheme => CustomColorTheme(
      surface: surface,
      feedback: feedback,
      interactive: interactive,
      overlay: overlay,
      popup: popup,
      transparent: transparent);
}
