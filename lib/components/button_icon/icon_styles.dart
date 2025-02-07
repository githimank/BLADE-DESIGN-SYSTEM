import 'package:blade_design_system/components/button_icon/icon_button.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class IconButtonPropertyColors {
  final Color? focusBorder;
  final Color icon;

  const IconButtonPropertyColors(
      {this.focusBorder,required this.icon});
}

class ButtonIconStateColors {
  final IconButtonPropertyColors defaultColor;
  final IconButtonPropertyColors hoverColor;
  final IconButtonPropertyColors focusColor;
  final IconButtonPropertyColors disabledColor;
  final IconButtonPropertyColors active;

  const ButtonIconStateColors({
    required this.defaultColor,
    required this.hoverColor,
    required this.focusColor,
    required this.disabledColor,
    required this.active,
  });
}

class ButtonIconProperties {
  final ButtonIconStateColors intense;
  final ButtonIconStateColors subtle;

  ButtonIconProperties(
      {
        required this.intense,
        required this.subtle,
      });

  ButtonIconStateColors stateColors(IconButtonEmphasis emphasis) {
    return switch (emphasis) {
      IconButtonEmphasis.INTENSE => intense,
      IconButtonEmphasis.SUBTLE => subtle,
    };
  }
  static ButtonIconProperties fromContext(BuildContext context) =>
      ButtonIconProperties(
        intense: ButtonIconStateColors(
          defaultColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.gray.muted),
          hoverColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.gray.subtle),
          focusColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.gray.subtle),
          disabledColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.gray.subtle),
          active: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.gray.disabled),
        ),
        subtle: ButtonIconStateColors(
          defaultColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.staticWhite.muted),
          hoverColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
          focusColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
          disabledColor: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.staticWhite.disabled),
          active: IconButtonPropertyColors(
              focusBorder: context.colorTheme.surface.border.primary.muted,
              icon: context.colorTheme.interactive.icon.staticWhite.subtle),
        ),
      );
}
