import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

enum ChipIntent {
  PRIMARY,
  POSITIVE,
  NEGATIVE,
}

class ChipStyle {
  final Color selectedColor;
  final Color background;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final Color disabledColor;
  final Color focusedColor;
  final Color hoverColor;

  ChipStyle({
    required this.selectedColor,
    required this.background,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
    required this.disabledColor,
    required this.focusedColor,
    required this.hoverColor,
  });

  static ChipStyle getStyle(ChipIntent intent, bool isDisabled, bool isSelected,
      BuildContext context) {
    switch (intent) {
      case ChipIntent.PRIMARY:
        return _buildPrimaryStyle(isDisabled, isSelected, context);
      case ChipIntent.POSITIVE:
        return _buildPositiveStyle(isDisabled, isSelected, context);
      case ChipIntent.NEGATIVE:
        return _buildNegativeStyle(isDisabled, isSelected, context);
    }
  }

  static ChipStyle _buildPrimaryStyle(
      bool isDisabled, bool isSelected, BuildContext context) {
    return ChipStyle(
      selectedColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.primary.faded
              : context.colorTheme.interactive.background.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.background.primary.faded
              : context.colorTheme.surface.background.gray.intense),
      background: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.primary.faded
              : context.colorTheme.interactive.background.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.background.primary.faded
              : context.colorTheme.surface.background.gray.intense),
      borderColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.border.primary.disabled
              : context.colorTheme.interactive.border.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.border.primary.defaultColor
              : context.colorTheme.interactive.border.gray.faded),
      textColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.text.primary.disabled
              : context.colorTheme.interactive.text.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.text.primary.normal
              : context.colorTheme.interactive.text.gray.subtle),
      iconColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.icon.primary.disabled
              : context.colorTheme.interactive.icon.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.icon.primary.normal
              : context.colorTheme.interactive.icon.gray.subtle),
      disabledColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.primary.faded
              : context.colorTheme.interactive.background.gray.disabled)
          : context.colorTheme.interactive.background.gray.disabled,
      hoverColor: isSelected ? context.colorTheme.interactive.background.primary.fadedHighlighted : context.colorTheme.interactive.background.gray.faded,
      focusedColor: isSelected ? context.colorTheme.interactive.background.primary.fadedHighlighted : context.colorTheme.interactive.background.gray.faded,
    );
  }

  static ChipStyle _buildPositiveStyle(
      bool isDisabled, bool isSelected, BuildContext context) {
    return ChipStyle(
      selectedColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.positive.faded
              : context.colorTheme.interactive.background.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.background.positive.faded
              : context.colorTheme.surface.background.gray.intense),
      background: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.positive.faded
              : context.colorTheme.interactive.background.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.background.positive.faded
              : context.colorTheme.surface.background.gray.intense),
      borderColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.border.positive.disabled
              : context.colorTheme.interactive.border.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.border.positive.defaultColor
              : context.colorTheme.interactive.border.gray.faded),
      textColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.text.positive.disabled
              : context.colorTheme.interactive.text.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.text.positive.normal
              : context.colorTheme.interactive.text.gray.subtle),
      iconColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.icon.positive.disabled
              : context.colorTheme.interactive.icon.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.icon.positive.normal
              : context.colorTheme.interactive.icon.gray.subtle),
      disabledColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.positive.faded
              : context.colorTheme.interactive.background.gray.disabled)
          : context.colorTheme.interactive.background.gray.disabled,
      hoverColor: isSelected ? context.colorTheme.interactive.background.positive.fadedHighlighted : context.colorTheme.interactive.background.gray.faded,
      focusedColor: isSelected ? context.colorTheme.interactive.background.positive.fadedHighlighted : context.colorTheme.interactive.background.gray.faded,
    );
  }

  static ChipStyle _buildNegativeStyle(
      bool isDisabled, bool isSelected, BuildContext context) {
    return ChipStyle(
      selectedColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.negative.disabled
              : context.colorTheme.interactive.background.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.background.negative.faded
              : context.colorTheme.surface.background.gray.intense),
      background: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.negative.disabled
              : context.colorTheme.interactive.background.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.background.negative.faded
              : context.colorTheme.surface.background.gray.intense),
      borderColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.border.negative.disabled
              : context.colorTheme.interactive.border.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.border.negative.defaultColor
              : context.colorTheme.interactive.border.gray.faded),
      textColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.text.negative.disabled
              : context.colorTheme.interactive.text.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.text.negative.normal
              : context.colorTheme.interactive.text.gray.subtle),
      iconColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.icon.negative.disabled
              : context.colorTheme.interactive.icon.gray.disabled)
          : (isSelected
              ? context.colorTheme.interactive.icon.negative.normal
              : context.colorTheme.interactive.icon.gray.subtle),
      disabledColor: isDisabled
          ? (isSelected
              ? context.colorTheme.interactive.background.negative.disabled
              : context.colorTheme.interactive.background.gray.disabled)
          : context.colorTheme.interactive.background.gray.disabled,
      hoverColor: isSelected ? context.colorTheme.interactive.background.negative.fadedHighlighted : context.colorTheme.interactive.background.gray.faded,
      focusedColor: isSelected ? context.colorTheme.interactive.background.negative.fadedHighlighted : context.colorTheme.interactive.background.gray.faded,
    );
  }
}
