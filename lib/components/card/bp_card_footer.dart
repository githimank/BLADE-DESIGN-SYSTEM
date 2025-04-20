import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/components/button/button_widget.dart';
import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/responsive/responsive_builder.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'footer_action.dart';

class BpCardFooter extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final FooterAction? primaryFooterAction;
  final FooterAction? secondaryFooterAction;
  final bool showDivider;
  final bool isActionFullWidth;

  const BpCardFooter({
    super.key,
    this.title,
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    this.primaryFooterAction,
    this.secondaryFooterAction,
    this.showDivider = true,
    this.isActionFullWidth = false,
  });

  _buildFooterDesc(BuildContext context, int flex) {
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: titleStyle ??
                  context.appTypography.bodyMedium.semiBold.setColor(
                    context.colorTheme.surface.text.gray.normal,
                  ),
            ),
          ],
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
    );
  }

  _buildFooterAction(bool isFullWidth) {
    return Expanded(
      flex: isFullWidth ? 1 : 0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: isFullWidth
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          if (secondaryFooterAction != null) ...[
            Expanded(
              flex: isFullWidth ? 1 : 0,
              child: ButtonWidget.secondary(
                size: ButtonSize.MEDIUM,
                mood: secondaryFooterAction!.color,
                label: secondaryFooterAction!.text,
                leading:
                    secondaryFooterAction!.iconPosition == IconPosition.LEFT
                        ? secondaryFooterAction!.icon
                        : null,
                trailing:
                    secondaryFooterAction!.iconPosition == IconPosition.RIGHT
                        ? secondaryFooterAction!.icon
                        : null,
                isIconOnly: secondaryFooterAction!.isIconOnly,
                icon: secondaryFooterAction!.icon,
                isFullWidth: isFullWidth,
                isDisabled: secondaryFooterAction!.isDisabled,
                onTap: secondaryFooterAction!.onTap,
              ),
            ),
            Spacings.spacing3.wBox,
          ],
          if (primaryFooterAction != null)
            Expanded(
              flex: isFullWidth ? 1 : 0,
              child: ButtonWidget.primary(
                size: ButtonSize.MEDIUM,
                mood: primaryFooterAction!.color,
                label: primaryFooterAction!.text,
                leading: primaryFooterAction!.iconPosition == IconPosition.LEFT
                    ? primaryFooterAction!.icon
                    : null,
                trailing:
                    primaryFooterAction!.iconPosition == IconPosition.RIGHT
                        ? primaryFooterAction!.icon
                        : null,
                isIconOnly: primaryFooterAction!.isIconOnly,
                icon: primaryFooterAction!.icon,
                isFullWidth: isFullWidth,
                isDisabled: primaryFooterAction!.isDisabled,
                onTap: primaryFooterAction!.onTap,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider) ...{const BpDivider(), Spacings.spacing4.hBox},
        ResponsiveBuilder(
          sWidgetBuilder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterDesc(context, 0),
                Spacings.spacing3.hBox,
                Row(
                  children: [
                    if (secondaryFooterAction != null) ...[
                      Flexible(
                        flex: 1,
                        child: ButtonWidget.secondary(
                          size: ButtonSize.MEDIUM,
                          mood: secondaryFooterAction!.color,
                          label: secondaryFooterAction!.text,
                          leading: secondaryFooterAction!.iconPosition ==
                                  IconPosition.LEFT
                              ? secondaryFooterAction!.icon
                              : null,
                          trailing: secondaryFooterAction!.iconPosition ==
                                  IconPosition.RIGHT
                              ? secondaryFooterAction!.icon
                              : null,
                          isIconOnly: secondaryFooterAction!.isIconOnly,
                          icon: secondaryFooterAction!.icon,
                          isFullWidth: true,
                          isDisabled: secondaryFooterAction!.isDisabled,
                        ),
                      ),
                    ],
                    Spacings.spacing3.wBox,
                    if (secondaryFooterAction != null) ...[
                      Flexible(
                        flex: secondaryFooterAction == null ? 2 : 1,
                        child: ButtonWidget.primary(
                          size: ButtonSize.MEDIUM,
                          mood: primaryFooterAction!.color,
                          label: primaryFooterAction!.text,
                          leading: primaryFooterAction!.iconPosition ==
                                  IconPosition.LEFT
                              ? primaryFooterAction!.icon
                              : null,
                          trailing: primaryFooterAction!.iconPosition ==
                                  IconPosition.RIGHT
                              ? primaryFooterAction!.icon
                              : null,
                          isIconOnly: primaryFooterAction!.isIconOnly,
                          icon: primaryFooterAction!.icon,
                          isFullWidth: true,
                          isDisabled: primaryFooterAction!.isDisabled,
                        ),
                      ),
                    ]
                  ],
                )
                // _buildFooterAction(true),
                // if (secondaryFooterAction != null) ...[
                //   BpButton.secondary(
                //     size: ButtonSize.MEDIUM,
                //     mood: secondaryFooterAction!.color,
                //     label: secondaryFooterAction!.text,
                //     leading:
                //         secondaryFooterAction!.iconPosition == IconPosition.LEFT
                //             ? secondaryFooterAction!.icon
                //             : null,
                //     trailing:
                //         secondaryFooterAction!.iconPosition == IconPosition.RIGHT
                //             ? secondaryFooterAction!.icon
                //             : null,
                //     isIconOnly: secondaryFooterAction!.isIconOnly,
                //     icon: secondaryFooterAction!.icon,
                //     isFullWidth: true,
                //     isDisabled: secondaryFooterAction!.isDisabled,
                //   ),
                // ],
                // Spacings.spacing3.wBox,
                // if (secondaryFooterAction != null) ...[
                //   BpButton.primary(
                //     size: ButtonSize.MEDIUM,
                //     mood: primaryFooterAction!.color,
                //     label: primaryFooterAction!.text,
                //     leading: primaryFooterAction!.iconPosition == IconPosition.LEFT
                //         ? primaryFooterAction!.icon
                //         : null,
                //     trailing:
                //         primaryFooterAction!.iconPosition == IconPosition.RIGHT
                //             ? primaryFooterAction!.icon
                //             : null,
                //     isIconOnly: primaryFooterAction!.isIconOnly,
                //     icon: primaryFooterAction!.icon,
                //     isFullWidth: true,
                //     isDisabled: primaryFooterAction!.isDisabled,
                //   ),
                // ]
              ],
            );
          },
          mWidgetBuilder: (context) {
            return Row(
              children: [
                if (title != null || subTitle != null)
                  _buildFooterDesc(context, 1),

                _buildFooterAction(isActionFullWidth),
                // if (secondaryFooterAction != null) ...[
                //   BpButton.secondary(
                //     size: ButtonSize.MEDIUM,
                //     mood: secondaryFooterAction!.color,
                //     label: secondaryFooterAction!.text,
                //     leading:
                //         secondaryFooterAction!.iconPosition == IconPosition.LEFT
                //             ? secondaryFooterAction!.icon
                //             : null,
                //     trailing:
                //         secondaryFooterAction!.iconPosition == IconPosition.RIGHT
                //             ? secondaryFooterAction!.icon
                //             : null,
                //     isIconOnly: secondaryFooterAction!.isIconOnly,
                //     icon: secondaryFooterAction!.icon,
                //     isFullWidth: false,
                //     isDisabled: secondaryFooterAction!.isDisabled,
                //   ),
                // ],
                // Spacings.spacing3.wBox,
                // if (secondaryFooterAction != null) ...[
                //   BpButton.primary(
                //     size: ButtonSize.MEDIUM,
                //     mood: primaryFooterAction!.color,
                //     label: primaryFooterAction!.text,
                //     leading: primaryFooterAction!.iconPosition == IconPosition.LEFT
                //         ? primaryFooterAction!.icon
                //         : null,
                //     trailing:
                //         primaryFooterAction!.iconPosition == IconPosition.RIGHT
                //             ? primaryFooterAction!.icon
                //             : null,
                //     isIconOnly: primaryFooterAction!.isIconOnly,
                //     icon: primaryFooterAction!.icon,
                //     isFullWidth: false,
                //     isDisabled: primaryFooterAction!.isDisabled,
                //   ),
                // ]
              ],
            );
          },
          xSWidgetBuilder: (BuildContext context) {
            return SizedBox();
          },
        ),
      ],
    );
  }
}
