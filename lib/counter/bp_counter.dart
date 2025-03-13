import 'package:blade_design_system/counter/counter_styles.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:flutter/material.dart';

enum CounterEmphasis {
  SUBTLE,
  INTENSE,
}

enum CounterSize {
  LARGE(20.0, iconHeight: 15),
  MEDIUM(18.0, iconHeight: 10),
  SMALL(14.0, iconHeight: 10);

  final double height;
  final double iconHeight;

  const CounterSize(this.height, {required this.iconHeight});

  TextStyle textStyle(BuildContext context) => switch (this) {
        CounterSize.LARGE => context.appTypography.bodyMedium.medium!,
        CounterSize.MEDIUM => context.appTypography.bodySmall.medium!,
        CounterSize.SMALL => context.appTypography.bodyXSmall.medium!,
      };
}

enum CounterMood {
  POSITIVE,
  NEGATIVE,
  NOTICE,
  INFORMATION,
  NEUTRAL,
  PRIMARY;
}

class BpCounter extends StatelessWidget {
  final CounterEmphasis emphasis;
  final CounterMood mood;
  final CounterSize size;
  final int label;
  final String? labelText;
  final int? max;

  const BpCounter(
      {this.emphasis = CounterEmphasis.SUBTLE,
      this.mood = CounterMood.POSITIVE,
      this.size = CounterSize.SMALL,
      required this.label,
      this.labelText,
      this.max,
      super.key});

  @override
  Widget build(BuildContext context) {
    final CounterProperties badgeProperties = switch (emphasis) {
      CounterEmphasis.INTENSE => CounterProperties.intense(context),
      CounterEmphasis.SUBTLE => CounterProperties.subtle(context),
    };

    final CounterStateColors counterTheme = badgeProperties.stateColors(mood);

    return Container(
      decoration: BoxDecoration(
        color: counterTheme.defaultColor.background,
        borderRadius: Borders.radii.xxLarge,
        border: Border.all(
          color: context.colorTheme.transparent,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              labelText ??
                  (max != null && label >= max!
                      ? max.toString()
                      : label.toString()),
              style: size
                  .textStyle(context)
                  .copyWith(color: counterTheme.defaultColor.text),
            ),
          ),
          if (max != null && label >= max!) ...[
            Icon(
              Icons.add,
              size: size.iconHeight,
              color: counterTheme.defaultColor.icon,
            ),
          ],
        ],
      ),
    );
  }
}
