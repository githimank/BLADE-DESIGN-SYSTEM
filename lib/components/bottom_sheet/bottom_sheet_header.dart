import 'package:blade_design_system/components/badges/bp_badges.dart';
import 'package:blade_design_system/components/button_icon/icon_button.dart';
import 'package:blade_design_system/components/links/bp_link.dart';
import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final BpCounter? titleSuffix;
  final BpBadges? trailingBadge;
  final Widget? leading;
  final Text? trailingText;
  final BpLink? trailingLink;
  final BpIconButton? trailingIcon;
  final bool showBackButton;
  final VoidCallback? onTapTrailingLink;
  final VoidCallback? onTapTrailingIcon;
  final VoidCallback? onTapBackButton;

  const BottomSheetHeader({
    super.key,
    this.title,
    this.subTitle,
    this.leading,
    this.titleSuffix,
    this.trailingBadge,
    this.trailingText,
    this.trailingLink,
    this.trailingIcon,
    this.showBackButton = false,
    this.onTapTrailingLink,
    this.onTapTrailingIcon,
    this.onTapBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Spacings.spacing5,
          right: Spacings.spacing5,
          top: Spacings.spacing4,
          bottom: Spacings.spacing5),
      child: Column(
        // Aligns subtitle text to the left edge of the title
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ─────────────────────────────────────────────────────────────────
          // Row for Leading/Back + Title Column + Trailing Items
          // ─────────────────────────────────────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // (1) Leading widget (if any)
              if (leading != null) leading!,

              // (2) Back Button (if enabled)
              if (showBackButton)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: Spacings.spacing2),
                  child: BpIconButton(
                    icon: const Icon(Icons.arrow_back),
                    onTap: onTapBackButton,
                    size: IconButtonSize.LARGE,
                    emphasis: IconButtonEmphasis.INTENSE,
                  ),
                ),

              // Spacing if (leading or back button) exist
              if (leading != null || showBackButton)
                const SizedBox(width: Spacings.spacing5),

              // (3) Title + (optional) Suffix + Subtitle
              // Use Expanded to push trailing items to the right
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row for Title + optional suffix
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: context.appTypography.bodyLarge.semiBold
                                .setColor(
                              context.colorTheme.surface.text.gray.normal,
                            ),
                          ),
                        if (titleSuffix != null) ...[
                          Spacings.spacing3.wBox,
                          titleSuffix!,
                        ],
                      ],
                    ),

                    // (4) Subtitle below the title, if provided
                    if (subTitle != null) ...[
                      Spacings.spacing2.hBox,
                      Text(
                        subTitle!,
                        style: context.appTypography.bodySmall.regular.setColor(
                          context.colorTheme.surface.text.gray.muted,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              Spacings.spacing5.wBox,
              // (5) Trailing items (badge, text, link, icon) + Close button
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (trailingBadge != null) ...{
                    trailingBadge!,
                    Spacings.spacing5.wBox,
                  },
                  if (trailingText != null) ...{
                    trailingText!,
                    Spacings.spacing5.wBox,
                  },
                  if (trailingLink != null) ...{
                    trailingLink!,
                    Spacings.spacing5.wBox,
                  },
                  if (trailingIcon != null) ...{
                    trailingIcon!,
                    Spacings.spacing5.wBox,
                  },
                  BpIconButton(
                    icon: const Icon(Icons.close),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    size: IconButtonSize.LARGE,
                    emphasis: IconButtonEmphasis.INTENSE,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}