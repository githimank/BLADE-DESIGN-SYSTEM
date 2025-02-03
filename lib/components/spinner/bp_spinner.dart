import 'package:blade_design_system/theme/colors/color_mood.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'bp_circular_progress_indicator.dart';

enum SpinnerMood {
  PRIMARY,
  POSITIVE,
  NEGATIVE,
  NOTICE,
  INFORMATION,
  DEFAULT,
  WHITE;

  ColorMood mood(BuildContext context) {
    return switch (this) {
      SpinnerMood.PRIMARY => context.colorTheme.surface.background.primary,
      SpinnerMood.POSITIVE => context.colorTheme.feedback.background.positive,
      SpinnerMood.NEGATIVE => context.colorTheme.feedback.background.negative,
      SpinnerMood.NOTICE => context.colorTheme.feedback.background.notice,
      SpinnerMood.INFORMATION =>
        context.colorTheme.feedback.background.information,
      SpinnerMood.DEFAULT => context.colorTheme.feedback.background.neutral,
      SpinnerMood.WHITE => context.colorTheme.surface.background.gray,
    };
  }

  Color textColor(BuildContext context) {
    return switch (this) {
      SpinnerMood.PRIMARY => context.colorTheme.surface.text.gray.muted,
      SpinnerMood.POSITIVE => context.colorTheme.surface.text.gray.muted,
      SpinnerMood.NEGATIVE => context.colorTheme.surface.text.gray.muted,
      SpinnerMood.NOTICE => context.colorTheme.surface.text.gray.muted,
      SpinnerMood.INFORMATION => context.colorTheme.surface.text.gray.muted,
      SpinnerMood.DEFAULT => context.colorTheme.surface.text.gray.muted,
      SpinnerMood.WHITE => context.colorTheme.surface.text.staticWhite.subtle,
    };
  }
}

enum SpinnerSize {
  MEDIUM(height: 16, strokeWidth: 2),
  LARGE(height: 20, strokeWidth: 2.5),
  XLARGE(height: 24, strokeWidth: 3);

  final double height;
  final double strokeWidth;

  const SpinnerSize({required this.height, required this.strokeWidth});

  double get gap => switch (this) {
        SpinnerSize.MEDIUM => Spacings.spacing2,
        SpinnerSize.LARGE => Spacings.spacing3,
        SpinnerSize.XLARGE => Spacings.spacing3,
      };
}

enum LabelPosition {
  RIGHT,
  BOTTOM;
}

class BpSpinner extends StatelessWidget {
  final String? label;
  final SpinnerSize size;
  final SpinnerMood mood;
  final LabelPosition labelPosition;

  const BpSpinner(
      {super.key,
      this.label,
      this.size = SpinnerSize.MEDIUM,
      this.mood = SpinnerMood.WHITE,
      this.labelPosition = LabelPosition.RIGHT});

  @override
  Widget build(BuildContext context) {
    final spinner = BpCircularProgressIndicator(
      height: size.height,
      strokeWidth: size.strokeWidth,
      arcColor: mood.mood(context).intense,
      trackColor: mood.mood(context).subtle,
    );
    final labelWidget = Text(
      label ?? '',
      style: context.appTypography.bodySmall.setColor(mood.textColor(context)),
    );
    Widget widget;
    if (label != null) {
      if (labelPosition == LabelPosition.RIGHT) {
        widget = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [spinner, size.gap.wBox, labelWidget],
        );
      } else {
        widget = Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [spinner, size.gap.hBox, labelWidget],
        );
      }
    } else {
      widget = spinner;
    }

    return Center(
      child: widget,
    );
  }
}
