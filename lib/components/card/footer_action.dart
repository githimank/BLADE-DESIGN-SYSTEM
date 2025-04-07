import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:flutter/material.dart';

enum IconPosition {
  LEFT,
  RIGHT;
}

class FooterAction {
  final String text;
  final VoidCallback? onTap;
  final bool isDisabled;
  final String? accessibilityLabel;
  final Widget? icon;
  final IconPosition iconPosition;
  final bool isLoading;
  final bool isIconOnly;
  final ButtonMood color;

  FooterAction({
    required this.text,
    this.onTap,
    this.isDisabled = false,
    this.accessibilityLabel,
    this.icon,
    this.iconPosition = IconPosition.LEFT,
    this.isLoading = false,
    this.isIconOnly = false,
    this.color = ButtonMood.PRIMARY,
  });
}
