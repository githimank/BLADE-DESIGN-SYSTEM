import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'badge_styles.dart';

enum BadgeEmphasis {
  SUBTLE,
  INTENSE,
}

enum BadgeSize {
  LARGE(24.0, Spacings.spacing4),
  MEDIUM(20.0, Spacings.spacing3),
  SMALL(16.0, Spacings.spacing2);

  final double height;
  final double horizontalPadding;

  const BadgeSize(this.height, this.horizontalPadding);

  TextStyle textStyle(BuildContext context) => switch (this) {
        BadgeSize.LARGE => context.appTypography.bodySmall.medium!,
        BadgeSize.MEDIUM => context.appTypography.bodySmall.medium!,
        BadgeSize.SMALL => context.appTypography.bodyXSmall.medium!,
      };
}

enum BadgeMood {
  POSITIVE,
  NEGATIVE,
  NOTICE,
  INFORMATION,
  NEUTRAL,
  PRIMARY;
}

class BpBadges extends StatelessWidget {
  final BadgeEmphasis emphasis;
  final BadgeMood mood;
  final BadgeSize size;
  final bool showLeadingIcon;
  final Widget? icon;
  final String label;

  const BpBadges(
      {this.emphasis = BadgeEmphasis.SUBTLE,
      this.mood = BadgeMood.POSITIVE,
      this.size = BadgeSize.MEDIUM,
      required this.label,
      this.showLeadingIcon = false,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final BadgeProperties badgeProperties = switch (emphasis) {
      BadgeEmphasis.INTENSE => BadgeProperties.intense(context),
      BadgeEmphasis.SUBTLE => BadgeProperties.subtle(context),
    };

    final BadgeStateColors badgeTheme = badgeProperties.stateColors(mood);

    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(
        horizontal: size.horizontalPadding,
      ),
      decoration: BoxDecoration(
        color: badgeTheme.defaultColor.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLeadingIcon && icon != null) ...[
            IconTheme(
              data: IconThemeData(
                  color: badgeTheme.defaultColor.icon, size: Spacings.spacing5),
              child: icon!,
            ),
            Spacings.spacing3.wBox,
          ],
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: size
                  .textStyle(context)
                  .copyWith(color: badgeTheme.defaultColor.text),
            ),
          ),
        ],
      ),
    );
  }
}
