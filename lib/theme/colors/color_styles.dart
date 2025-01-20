
import 'color_mood.dart';

class ColorStyle {
  final ColorStyleType background;
  final ColorStyleType border;
  final ColorStyleType text;
  final ColorStyleType icon;

  const ColorStyle({
    this.background = const ColorStyleType(),
    this.border = const ColorStyleType(),
    this.text = const ColorStyleType(),
    this.icon = const ColorStyleType(),
  });

  static ColorStyle lerp(ColorStyle a, ColorStyle b, double t) {
    return ColorStyle(
      background: ColorStyleType.lerp(a.background, b.background, t),
      border: ColorStyleType.lerp(a.border, b.border, t),
      text: ColorStyleType.lerp(a.text, b.text, t),
      icon: ColorStyleType.lerp(a.icon, b.icon, t),
    );
  }
}

class OverlayColorStyle {
  final ColorMood background;

  const OverlayColorStyle({
    this.background = const ColorMood(),
  });

  static OverlayColorStyle lerp(
      OverlayColorStyle a, OverlayColorStyle b, double t) {
    return OverlayColorStyle(
      background: ColorMood.lerp(a.background, b.background, t),
    );
  }
}

class PopupColorStyle {
  final ColorMood background;
  final ColorMood border;

  const PopupColorStyle({
    this.background = const ColorMood(),
    this.border = const ColorMood(),
  });

  static PopupColorStyle lerp(PopupColorStyle a, PopupColorStyle b, double t) {
    return PopupColorStyle(
      background: ColorMood.lerp(a.background, b.background, t),
      border: ColorMood.lerp(a.border, b.border, t),
    );
  }
}

class ColorStyleType {
  final ColorMood gray;
  final ColorMood primary;
  final ColorMood sea;
  final ColorMood cloud;
  final ColorMood onSea;
  final ColorMood onCloud;
  final ColorMood staticWhite;
  final ColorMood staticBlack;
  final ColorMood positive;
  final ColorMood negative;
  final ColorMood notice;
  final ColorMood information;
  final ColorMood neutral;
  final ColorMood onPrimary;

  const ColorStyleType({
    this.gray = const ColorMood(),
    this.primary = const ColorMood(),
    this.sea = const ColorMood(),
    this.cloud = const ColorMood(),
    this.onSea = const ColorMood(),
    this.onCloud = const ColorMood(),
    this.staticWhite = const ColorMood(),
    this.staticBlack = const ColorMood(),
    this.positive = const ColorMood(),
    this.negative = const ColorMood(),
    this.notice = const ColorMood(),
    this.information = const ColorMood(),
    this.neutral = const ColorMood(),
    this.onPrimary = const ColorMood(),
  });

  static ColorStyleType lerp(ColorStyleType a, ColorStyleType b, double t) {
    return ColorStyleType(
      gray: ColorMood.lerp(a.gray, b.gray, t),
      primary: ColorMood.lerp(a.primary, b.primary, t),
      sea: ColorMood.lerp(a.sea, b.sea, t),
      cloud: ColorMood.lerp(a.cloud, b.cloud, t),
      onSea: ColorMood.lerp(a.onSea, b.onSea, t),
      onCloud: ColorMood.lerp(a.onCloud, b.onCloud, t),
      staticWhite: ColorMood.lerp(a.staticWhite, b.staticWhite, t),
      staticBlack: ColorMood.lerp(a.staticBlack, b.staticBlack, t),
      positive: ColorMood.lerp(a.positive, b.positive, t),
      negative: ColorMood.lerp(a.negative, b.negative, t),
      notice: ColorMood.lerp(a.notice, b.notice, t),
      information: ColorMood.lerp(a.information, b.information, t),
      neutral: ColorMood.lerp(a.neutral, b.neutral, t),
      onPrimary: ColorMood.lerp(a.onPrimary, b.onPrimary, t),
    );
  }
}
