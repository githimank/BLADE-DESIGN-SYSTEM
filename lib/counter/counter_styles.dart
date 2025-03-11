import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class CounterPropertyColors {
  final Color background;
  final Color text;
  final Color icon;

  const CounterPropertyColors({
    required this.background,
    required this.text,
    required this.icon,
  });
}

class CounterStateColors {
  final CounterPropertyColors defaultColor;

  const CounterStateColors({
    required this.defaultColor,
  });
}

class CounterProperties {
  final CounterStateColors primary;
  final CounterStateColors negative;
  final CounterStateColors positive;
  final CounterStateColors notice;
  final CounterStateColors information;
  final CounterStateColors neutral;

  CounterProperties({
    required this.primary,
    required this.negative,
    required this.positive,
    required this.notice,
    required this.information,
    required this.neutral,
  });

  CounterStateColors stateColors(CounterMood mood) {
    return switch (mood) {
      CounterMood.PRIMARY => primary,
      CounterMood.NEGATIVE => negative,
      CounterMood.POSITIVE => positive,
      CounterMood.NOTICE => notice,
      CounterMood.INFORMATION => information,
      CounterMood.NEUTRAL => neutral
    };
  }

  static CounterProperties subtle(BuildContext context) => CounterProperties(
    positive: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.positive.subtle,
        text: context.colorTheme.feedback.text.positive.intense,
        icon: context.colorTheme.feedback.icon.positive.intense,
      ),
    ),
    negative: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.negative.subtle,
        text: context.colorTheme.feedback.text.negative.intense,
        icon: context.colorTheme.feedback.icon.negative.intense,
      ),
    ),
    notice: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.notice.subtle,
        text: context.colorTheme.feedback.text.notice.intense,
        icon: context.colorTheme.feedback.icon.notice.intense,
      ),
    ),
    information: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.information.subtle,
        text: context.colorTheme.feedback.text.information.intense,
        icon: context.colorTheme.feedback.icon.information.intense,
      ),
    ),
    neutral: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.neutral.subtle,
        text: context.colorTheme.feedback.text.neutral.intense,
        icon: context.colorTheme.feedback.icon.neutral.intense,
      ),
    ),
    primary: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.surface.background.primary.subtle,
        text: context.colorTheme.surface.text.primary.normal,
        icon: context.colorTheme.surface.icon.primary.normal,
      ),
    ),
  );

  static CounterProperties intense(BuildContext context) => CounterProperties(
    positive: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.positive.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    negative: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.negative.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    notice: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.notice.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    information: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.information.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    neutral: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.feedback.background.neutral.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
    primary: CounterStateColors(
      defaultColor: CounterPropertyColors(
        background: context.colorTheme.surface.background.primary.intense,
        text: context.colorTheme.surface.text.staticWhite.normal,
        icon: context.colorTheme.surface.icon.staticWhite.normal,
      ),
    ),
  );
}