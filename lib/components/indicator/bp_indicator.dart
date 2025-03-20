import 'package:blade_design_system/theme/colors/color_mood.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

enum IndicatorEmphasis {
  SUBTLE,
  INTENSE;

  Color getColor(ColorMood mood){
    return switch (this){
      IndicatorEmphasis.SUBTLE => mood.intense,
      IndicatorEmphasis.INTENSE => mood.intense,
    };
  }
}

enum IndicatorLabelDotSize {
  LARGE(20.0, dotSize: 10.0),
  MEDIUM(20.0, dotSize: 8.0),
  SMALL(18.0, dotSize: 6.0);

  final double size;
  final double dotSize;
  const IndicatorLabelDotSize(this.size,{required this.dotSize});

  TextStyle textStyle(BuildContext context) => switch (this) {
    IndicatorLabelDotSize.LARGE => context.appTypography.bodyMedium.medium!,
    IndicatorLabelDotSize.MEDIUM => context.appTypography.bodyMedium.medium!,
    IndicatorLabelDotSize.SMALL => context.appTypography.bodySmall.medium!,
  };

  Color textColor(BuildContext context) => switch (this) {
    IndicatorLabelDotSize.LARGE => context.colorTheme.surface.text.gray.subtle,
    IndicatorLabelDotSize.MEDIUM => context.colorTheme.surface.text.gray.subtle,
    IndicatorLabelDotSize.SMALL => context.colorTheme.surface.text.gray.subtle,
  };
}

enum IntentMood {
  POSITIVE,
  NEGATIVE,
  NOTICE,
  INFORMATION,
  NEUTRAL;

  ColorMood getColorMood(BuildContext context) => switch (this) {
    IntentMood.POSITIVE => context.colorTheme.feedback.background.positive,
    IntentMood.NEGATIVE => context.colorTheme.feedback.background.negative,
    IntentMood.NOTICE => context.colorTheme.feedback.background.notice,
    IntentMood.INFORMATION => context.colorTheme.feedback.background.information,
    IntentMood.NEUTRAL => context.colorTheme.feedback.background.neutral,
  };
}

class BpIndicator extends StatelessWidget {
  final String? label;
  final IndicatorLabelDotSize size;
  final IntentMood intent;
  final bool showLabel;
  final IndicatorEmphasis emphasis;

  const BpIndicator({
    super.key,
    this.label,
    this.size = IndicatorLabelDotSize.MEDIUM,
    this.intent = IntentMood.POSITIVE,
    this.showLabel = true,
    this.emphasis = IndicatorEmphasis.SUBTLE
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if(emphasis == IndicatorEmphasis.INTENSE)
              Container(
                width: size.dotSize + 10,
                height: size.dotSize + 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorTheme.feedback.background.positive.subtle,
                ),
              ),
            Container(
              width: size.dotSize,
              height: size.dotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: emphasis.getColor(intent.getColorMood(context)),
              ),
            ),
          ],
        ),
        // const SizedBox(width: 4),
        Spacings.spacing2.wBox,
        if (showLabel && label != null)
          Text(
            label!,
            style: size.textStyle(context),
          ),
      ],
    );
  }
}