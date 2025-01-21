import 'package:blade_design_system/theme/custom_color_theme.dart';
import 'package:blade_design_system/theme/tokens/colors.dart';
import 'package:flutter/material.dart';

import 'color_mood.dart';
import 'color_styles.dart';
import 'i_color_theme.dart';

class DarkColorThemeImpl implements IColorTheme {
  @override
  ColorStyle get feedback => ColorStyle(
        background: ColorStyleType(
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
            subtle: GlobalColors.neutralDarkA100,
            intense: GlobalColors.neutralDark800,
          ),
        ),
        border: ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emeraldA200,
            intense: GlobalColors.emerald800,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimsonA200,
            intense: GlobalColors.crimson800,
          ),
          notice: ColorMood(
            subtle: GlobalColors.ciderA200,
            intense: GlobalColors.cider800,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphireA200,
            intense: GlobalColors.sapphire800,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralDarkA100,
            intense: GlobalColors.neutralDark900,
          ),
        ),
        text: const ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emerald050,
            intense: GlobalColors.emerald400,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimson050,
            intense: GlobalColors.crimson400,
          ),
          notice: ColorMood(
            subtle: GlobalColors.cider050,
            intense: GlobalColors.cider400,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphire050,
            intense: GlobalColors.sapphire400,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralDark700,
            intense: GlobalColors.neutralDark050,
          ),
        ),
        icon: const ColorStyleType(
          positive: ColorMood(
            subtle: GlobalColors.emerald050,
            intense: GlobalColors.emerald400,
          ),
          negative: ColorMood(
            subtle: GlobalColors.crimson050,
            intense: GlobalColors.crimson400,
          ),
          notice: ColorMood(
            subtle: GlobalColors.cider050,
            intense: GlobalColors.cider400,
          ),
          information: ColorMood(
            subtle: GlobalColors.sapphire050,
            intense: GlobalColors.sapphire400,
          ),
          neutral: ColorMood(
            subtle: GlobalColors.neutralDark700,
            intense: GlobalColors.neutralDark050,
          ),
        ),
      );

  @override
  ColorStyle get interactive => ColorStyle(
        background: ColorStyleType(
          positive: ColorMood(
            defaultColor: GlobalColors.emerald600,
            highlighted: GlobalColors.emerald700,
            disabled: GlobalColors.emeraldA100,
            faded: GlobalColors.emeraldA150,
            fadedHighlighted: GlobalColors.emeraldA200,
          ),
          negative: ColorMood(
            defaultColor: GlobalColors.crimson600,
            highlighted: GlobalColors.crimson700,
            disabled: GlobalColors.crimsonA100,
            faded: GlobalColors.crimsonA150,
            fadedHighlighted: GlobalColors.crimsonA200,
          ),
          notice: ColorMood(
            defaultColor: GlobalColors.cider600,
            highlighted: GlobalColors.cider700,
            disabled: GlobalColors.ciderA100,
            faded: GlobalColors.ciderA150,
            fadedHighlighted: GlobalColors.ciderA200,
          ),
          information: ColorMood(
            defaultColor: GlobalColors.sapphire600,
            highlighted: GlobalColors.sapphire700,
            disabled: GlobalColors.sapphireA100,
            faded: GlobalColors.sapphireA150,
            fadedHighlighted: GlobalColors.sapphireA200,
          ),
          neutral: ColorMood(
            defaultColor: GlobalColors.neutralDark050,
            highlighted: GlobalColors.neutralDark200,
            disabled: GlobalColors.neutralDarkA100,
            faded: GlobalColors.neutralDarkA75,
            fadedHighlighted: GlobalColors.neutralDarkA100,
          ),
          gray: ColorMood(
            defaultColor: GlobalColors.neutralDarkA75,
            highlighted: GlobalColors.neutralDarkA100,
            disabled: GlobalColors.neutralDarkA50,
            faded: GlobalColors.neutralDarkA25,
            fadedHighlighted: GlobalColors.neutralDarkA75,
          ),
          primary: ColorMood(
            defaultColor: GlobalColors.velvora400,
            highlighted: GlobalColors.velvora500,
            disabled: GlobalColors.velvoraA100,
            faded: GlobalColors.velvoraA150,
            fadedHighlighted: GlobalColors.velvoraA200,
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
            defaultColor: GlobalColors.neutralDark200,
            highlighted: GlobalColors.neutralDark200,
            disabled: GlobalColors.neutralDark800,
            faded: GlobalColors.neutralDarkA100,
          ),
          gray: ColorMood(
            defaultColor: GlobalColors.neutralDark800,
            highlighted: GlobalColors.neutralDark800,
            disabled: GlobalColors.neutralDark1000,
            faded: GlobalColors.neutralDarkA100,
          ),
          primary: ColorMood(
            defaultColor: GlobalColors.velvora400,
            highlighted: GlobalColors.velvora500,
            disabled: GlobalColors.velvoraA200,
            faded: GlobalColors.velvoraA150,
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
            normal: GlobalColors.emerald400,
            subtle: GlobalColors.emerald500,
            muted: GlobalColors.emerald700,
            disabled: GlobalColors.emeraldA200,
          ),
          negative: ColorMood(
            normal: GlobalColors.crimson400,
            subtle: GlobalColors.crimson500,
            muted: GlobalColors.crimson700,
            disabled: GlobalColors.crimsonA200,
          ),
          notice: ColorMood(
            normal: GlobalColors.cider400,
            subtle: GlobalColors.cider500,
            muted: GlobalColors.cider700,
            disabled: GlobalColors.ciderA200,
          ),
          information: ColorMood(
            normal: GlobalColors.sapphire400,
            subtle: GlobalColors.sapphire500,
            muted: GlobalColors.sapphire700,
            disabled: GlobalColors.sapphireA200,
          ),
          neutral: ColorMood(
            normal: GlobalColors.neutralDark050,
            subtle: GlobalColors.neutralDark300,
            muted: GlobalColors.neutralDark600,
            disabled: GlobalColors.neutralDarkA200,
          ),
          gray: ColorMood(
            normal: GlobalColors.neutralDark050,
            subtle: GlobalColors.neutralDark300,
            muted: GlobalColors.neutralDark600,
            disabled: GlobalColors.neutralDarkA200,
          ),
          primary: ColorMood(
            normal: GlobalColors.velvora300,
            subtle: GlobalColors.velvora400,
            muted: GlobalColors.velvora600,
            disabled: GlobalColors.velvoraA200,
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
            normal: GlobalColors.emerald400,
            subtle: GlobalColors.emerald500,
            muted: GlobalColors.emerald700,
            disabled: GlobalColors.emeraldA200,
          ),
          negative: ColorMood(
            normal: GlobalColors.crimson400,
            subtle: GlobalColors.crimson500,
            muted: GlobalColors.crimson700,
            disabled: GlobalColors.crimsonA200,
          ),
          notice: ColorMood(
            normal: GlobalColors.cider400,
            subtle: GlobalColors.cider500,
            muted: GlobalColors.cider700,
            disabled: GlobalColors.ciderA200,
          ),
          information: ColorMood(
            normal: GlobalColors.sapphire400,
            subtle: GlobalColors.sapphire500,
            muted: GlobalColors.sapphire700,
            disabled: GlobalColors.sapphireA200,
          ),
          neutral: ColorMood(
            normal: GlobalColors.neutralDark050,
            subtle: GlobalColors.neutralDark300,
            muted: GlobalColors.neutralDark600,
            disabled: GlobalColors.neutralDarkA200,
          ),
          gray: ColorMood(
            normal: GlobalColors.neutralDark050,
            subtle: GlobalColors.neutralDark300,
            muted: GlobalColors.neutralDark600,
            disabled: GlobalColors.neutralDarkA200,
          ),
          primary: ColorMood(
            normal: GlobalColors.velvora300,
            subtle: GlobalColors.velvora400,
            muted: GlobalColors.velvora600,
            disabled: GlobalColors.velvoraA200,
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
          moderate: GlobalColors.neutralDarkA200,
          subtle: GlobalColors.black.withOpacity(0.8),
        ),
      );

  @override
  PopupColorStyle get popup => PopupColorStyle(
        background: const ColorMood(
          subtle: GlobalColors.neutralDark1000,
          intense: GlobalColors.neutralDark1000,
        ),
        border: ColorMood(
          subtle: GlobalColors.neutralDarkA100,
          intense: GlobalColors.neutralDarkA100,
        ),
      );

  @override
  ColorStyle get surface => ColorStyle(
        background: ColorStyleType(
          gray: const ColorMood(
            subtle: GlobalColors.neutralDark1300,
            moderate: GlobalColors.neutralDark1200,
            intense: GlobalColors.neutralDark1100,
          ),
          primary: ColorMood(
            subtle: GlobalColors.velvoraA200,
            intense: GlobalColors.velvora500,
          ),
          sea: const ColorMood(
            subtle: GlobalColors.sea900,
            intense: GlobalColors.sea100,
          ),
          cloud: const ColorMood(
            subtle: GlobalColors.cloud900,
            intense: GlobalColors.cloud100,
          ),
        ),
        border: ColorStyleType(
          gray: ColorMood(
            normal: GlobalColors.neutralDark700,
            subtle: GlobalColors.neutralDark900,
            muted: GlobalColors.neutralDarkA100,
          ),
          primary: ColorMood(
            normal: GlobalColors.velvora500,
            muted: GlobalColors.velvoraA200,
          ),
        ),
        text: ColorStyleType(
          gray: ColorMood(
            normal: GlobalColors.neutralDark050,
            subtle: GlobalColors.neutralDark300,
            muted: GlobalColors.neutralDark600,
            disabled: GlobalColors.neutralDarkA200,
          ),
          primary: const ColorMood(
            normal: GlobalColors.velvora300,
          ),
          onSea: const ColorMood(
            onSubtle: GlobalColors.forest200,
            onIntense: GlobalColors.forest800,
          ),
          onCloud: const ColorMood(
            onSubtle: GlobalColors.velvora200,
            onIntense: GlobalColors.velvora600,
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
            normal: GlobalColors.neutralDark050,
            subtle: GlobalColors.neutralDark300,
            muted: GlobalColors.neutralDark600,
            disabled: GlobalColors.neutralDarkA200,
          ),
          primary: const ColorMood(
            normal: GlobalColors.velvora300,
          ),
          onSea: const ColorMood(
            onSubtle: GlobalColors.forest400,
            onIntense: GlobalColors.forest600,
          ),
          onCloud: const ColorMood(
            onSubtle: GlobalColors.velvora300,
            onIntense: GlobalColors.velvora400,
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
