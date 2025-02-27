import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class LinkPropertyColors {
  final Color? focusBorder;
  final Color text;
  final Color icon;

  const LinkPropertyColors(
      {this.focusBorder, required this.text, required this.icon});
}

class LinkStateColors {
  final LinkPropertyColors defaultColor;
  final LinkPropertyColors hoverColor;
  final LinkPropertyColors focusColor;
  final LinkPropertyColors disabledColor;

  const LinkStateColors({
    required this.defaultColor,
    required this.hoverColor,
    required this.focusColor,
    required this.disabledColor,
  });
}

class LinkProperties {
  final LinkStateColors primary;
  final LinkStateColors white;
  final LinkStateColors negative;
  final LinkStateColors positive;
  final LinkStateColors notice;
  final LinkStateColors information;
  final LinkStateColors neutral;

  LinkProperties(
      {required this.primary,
      required this.white,
      required this.negative,
      required this.positive,
      required this.notice,
      required this.information,
      required this.neutral});

  LinkStateColors stateColors(ButtonMood mood) {
    return switch (mood) {
      ButtonMood.PRIMARY => primary,
      ButtonMood.WHITE => white,
      ButtonMood.NEGATIVE => negative,
      ButtonMood.POSITIVE => positive,
      ButtonMood.NOTICE => notice,
      ButtonMood.INFORMATION => information,
      ButtonMood.NEUTRAL => neutral
    };
  }

  static LinkProperties anchor(BuildContext context) =>
      LinkProperties(
        primary: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.normal,
              icon: context.colorTheme.interactive.icon.primary.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.subtle,
              icon: context.colorTheme.interactive.icon.primary.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.subtle,
              icon: context.colorTheme.interactive.icon.onPrimary.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.disabled,
              icon: context.colorTheme.interactive.icon.primary.disabled),
        ),
        white: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.normal,
              icon: context.colorTheme.interactive.icon.staticWhite.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.subtle,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.subtle,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.disabled,
              icon: context.colorTheme.interactive.icon.staticWhite.disabled),
        ),
        negative: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.normal,
              icon: context.colorTheme.interactive.icon.negative.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.subtle,
              icon: context.colorTheme.interactive.icon.negative.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.subtle,
              icon: context.colorTheme.interactive.icon.negative.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.disabled,
              icon: context.colorTheme.interactive.icon.negative.disabled),
        ),
        positive: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.normal,
              icon: context.colorTheme.interactive.icon.positive.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.subtle,
              icon: context.colorTheme.interactive.icon.positive.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.subtle,
              icon: context.colorTheme.interactive.icon.positive.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.disabled,
              icon: context.colorTheme.interactive.icon.positive.disabled),
        ),
        notice: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.normal,
              icon: context.colorTheme.interactive.icon.notice.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.subtle,
              icon: context.colorTheme.interactive.icon.notice.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.subtle,
              icon: context.colorTheme.interactive.icon.notice.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.disabled,
              icon: context.colorTheme.interactive.icon.notice.disabled),
        ),
        information: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.normal,
              icon: context.colorTheme.interactive.icon.information.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.subtle,
              icon: context.colorTheme.interactive.icon.information.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.subtle,
              icon: context.colorTheme.interactive.icon.information.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.disabled,
              icon: context.colorTheme.interactive.icon.information.disabled),
        ),
        neutral: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.normal,
              icon: context.colorTheme.interactive.icon.neutral.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.subtle,
              icon: context.colorTheme.interactive.icon.neutral.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.subtle,
              icon: context.colorTheme.interactive.icon.neutral.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.disabled,
              icon: context.colorTheme.interactive.icon.neutral.disabled),
        ),
      );

  static LinkProperties action(BuildContext context) =>
      LinkProperties(
        primary: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.normal,
              icon: context.colorTheme.interactive.icon.primary.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.subtle,
              icon: context.colorTheme.interactive.icon.primary.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.subtle,
              icon: context.colorTheme.interactive.icon.onPrimary.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.primary.disabled,
              icon: context.colorTheme.interactive.icon.primary.disabled),
        ),
        white: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.normal,
              icon: context.colorTheme.interactive.icon.staticWhite.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.subtle,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.subtle,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.staticWhite.disabled,
              icon: context.colorTheme.interactive.icon.staticWhite.disabled),
        ),
        negative: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.normal,
              icon: context.colorTheme.interactive.icon.negative.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.subtle,
              icon: context.colorTheme.interactive.icon.negative.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.subtle,
              icon: context.colorTheme.interactive.icon.negative.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.negative.disabled,
              icon: context.colorTheme.interactive.icon.negative.disabled),
        ),
        positive: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.normal,
              icon: context.colorTheme.interactive.icon.positive.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.subtle,
              icon: context.colorTheme.interactive.icon.positive.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.subtle,
              icon: context.colorTheme.interactive.icon.positive.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.positive.disabled,
              icon: context.colorTheme.interactive.icon.positive.disabled),
        ),
        notice: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.normal,
              icon: context.colorTheme.interactive.icon.notice.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.subtle,
              icon: context.colorTheme.interactive.icon.notice.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.subtle,
              icon: context.colorTheme.interactive.icon.notice.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.notice.disabled,
              icon: context.colorTheme.interactive.icon.notice.disabled),
        ),
        information: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.normal,
              icon: context.colorTheme.interactive.icon.information.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.subtle,
              icon: context.colorTheme.interactive.icon.information.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.subtle,
              icon: context.colorTheme.interactive.icon.information.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.information.disabled,
              icon: context.colorTheme.interactive.icon.information.disabled),
        ),
        neutral: LinkStateColors(
          defaultColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.normal,
              icon: context.colorTheme.interactive.icon.neutral.normal),
          hoverColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.subtle,
              icon: context.colorTheme.interactive.icon.neutral.subtle),
          focusColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.subtle,
              icon: context.colorTheme.interactive.icon.neutral.subtle),
          disabledColor: LinkPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              text: context.colorTheme.interactive.text.neutral.disabled,
              icon: context.colorTheme.interactive.icon.neutral.disabled),
        ),
      );
}
