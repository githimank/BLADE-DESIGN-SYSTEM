import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import 'bp_badges.dart';

class BadgePropertyColors {
  final Color background;
  final Color text;
  final Color icon;

  const BadgePropertyColors({
    required this.background,
    required this.text,
    required this.icon,
  });
}

class BadgeStateColors {
  final BadgePropertyColors defaultColor;

  const BadgeStateColors({
    required this.defaultColor,
  });
}

class BadgeProperties {
  final BadgeStateColors primary;
  final BadgeStateColors negative;
  final BadgeStateColors positive;
  final BadgeStateColors notice;
  final BadgeStateColors information;
  final BadgeStateColors neutral;

  BadgeProperties({
    required this.primary,
    required this.negative,
    required this.positive,
    required this.notice,
    required this.information,
    required this.neutral,
  });

  BadgeStateColors stateColors(BadgeMood mood) {
    return switch (mood) {
      BadgeMood.PRIMARY => primary,
      BadgeMood.NEGATIVE => negative,
      BadgeMood.POSITIVE => positive,
      BadgeMood.NOTICE => notice,
      BadgeMood.INFORMATION => information,
      BadgeMood.NEUTRAL => neutral
    };
  }

  static BadgeProperties subtle(BuildContext context) => BadgeProperties(
        positive: BadgeStateColors(
          defaultColor: BadgePropertyColors(
            background: context.colorTheme.feedback.background.positive.subtle,
            text: context.colorTheme.feedback.text.positive.intense,
            icon: context.colorTheme.feedback.icon.positive.intense,
          ),
        ),
        negative: BadgeStateColors(
          defaultColor: BadgePropertyColors(
            background: context.colorTheme.feedback.background.negative.subtle,
            text: context.colorTheme.feedback.text.negative.intense,
            icon: context.colorTheme.feedback.icon.negative.intense,
          ),
        ),
        notice: BadgeStateColors(
          defaultColor: BadgePropertyColors(
            background: context.colorTheme.feedback.background.notice.subtle,
            text: context.colorTheme.feedback.text.notice.intense,
            icon: context.colorTheme.feedback.icon.notice.intense,
          ),
        ),
        information: BadgeStateColors(
          defaultColor: BadgePropertyColors(
            background: context.colorTheme.feedback.background.information.subtle,
            text: context.colorTheme.feedback.text.information.intense,
            icon: context.colorTheme.feedback.icon.information.intense,
          ),
        ),
        neutral: BadgeStateColors(
          defaultColor: BadgePropertyColors(
            background: context.colorTheme.feedback.background.neutral.subtle,
            text: context.colorTheme.feedback.text.neutral.intense,
            icon: context.colorTheme.feedback.icon.neutral.intense,
          ),
        ),
        primary: BadgeStateColors(
          defaultColor: BadgePropertyColors(
            background: context.colorTheme.surface.background.primary.subtle,
            text: context.colorTheme.surface.text.primary.normal,
            icon: context.colorTheme.surface.icon.primary.normal,
          ),
        ),
      );

  static BadgeProperties intense(BuildContext context) => BadgeProperties(
    positive: BadgeStateColors(
      defaultColor: BadgePropertyColors(
        background: context.colorTheme.feedback.background.positive.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    negative: BadgeStateColors(
      defaultColor: BadgePropertyColors(
        background: context.colorTheme.feedback.background.negative.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    notice: BadgeStateColors(
      defaultColor: BadgePropertyColors(
        background: context.colorTheme.feedback.background.notice.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    information: BadgeStateColors(
      defaultColor: BadgePropertyColors(
        background: context.colorTheme.feedback.background.information.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    neutral: BadgeStateColors(
      defaultColor: BadgePropertyColors(
        background: context.colorTheme.feedback.background.neutral.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    primary: BadgeStateColors(
      defaultColor: BadgePropertyColors(
        background: context.colorTheme.surface.background.primary.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
  );
}
