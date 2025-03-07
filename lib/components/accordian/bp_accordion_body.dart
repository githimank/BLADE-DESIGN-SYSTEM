import 'package:blade_design_system/components/accordian/accordion_enum.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpAccordionBody extends StatelessWidget {
  final Widget? child;
  final String? description;
  final AccordionSize size; // 'large' or 'medium'

  const BpAccordionBody({
    super.key,
    this.child,
    this.description,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionStyle = switch (size) {
      AccordionSize.LARGE => context.appTypography.bodyLarge.regular!,
      AccordionSize.MEDIUM => context.appTypography.bodyMedium.regular!
    };

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Spacings.spacing5, vertical: Spacings.spacing5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (description != null)
            Text(description!,
                style: descriptionStyle
                    .setColor(context.colorTheme.surface.text.gray.subtle)),
          if (description != null && child != null) Spacings.spacing5.hBox,
          if (child != null) child!
        ],
      ),
    );
  }
}
