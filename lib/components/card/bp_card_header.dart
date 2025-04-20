import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpCardHeader extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final BpCounter? titleSuffix;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final Widget? leading;
  final Widget? trailing;
  final bool showDivider;
  final bool isTitleExpanded;
  final VoidCallback? onTap;

  const BpCardHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.titleSuffix,
    this.subTitle,
    this.subTitleStyle,
    this.leading,
    this.trailing,
    this.showDivider = true,
    this.isTitleExpanded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leading != null) ...[leading!, Spacings.spacing4.wBox],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: isTitleExpanded ? 1 : 0,
                          child: Text(
                            title,
                            style: titleStyle ??
                                context.appTypography.bodyLarge.semiBold
                                    .setColor(
                                  context.colorTheme.surface.text.gray.normal,
                                ),
                          ),
                        ),
                        if (titleSuffix != null) ...[
                          Spacings.spacing3.wBox,
                          titleSuffix!,
                        ],
                      ],
                    ),
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: subTitleStyle ??
                            context.appTypography.bodySmall.regular.setColor(
                              context.colorTheme.surface.text.gray.muted,
                            ),
                      ),
                  ],
                ),
              ),
              if (trailing != null) trailing!
            ],
          ),
          if (showDivider) ...{
            Spacings.spacing4.hBox,
            const BpDivider(),
          }
        ],
      ),
    );
  }
}
