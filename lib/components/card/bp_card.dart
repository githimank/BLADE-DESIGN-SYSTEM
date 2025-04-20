import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/elevations.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'bp_card_footer.dart';
import 'bp_card_header.dart';

class BpCard extends StatelessWidget {
  final Widget? body;
  final BpCardHeader? header;
  final BpCardFooter? footer;
  final double? width;
  final double? height;
  final List<BoxShadow> elevation;

  BpCard({
    super.key,
    this.body,
    this.width,
    this.height,
    this.header,
    this.footer,
    this.elevation = Elevations.none,
  }) : assert(
          header == null ||
              header.titleSuffix == null ||
              header.titleSuffix!.size == CounterSize.MEDIUM,
          'If header is not null and header.titleSuffix is provided, its size must be CounterSize.MEDIUM.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacings.spacing7),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: context.colorTheme.surface.background.gray.intense,
        borderRadius: Borders.radii.medium,
        border: elevation == Elevations.none
            ? Border.all(
                width: Borders.widths.thin,
                color: context.colorTheme.surface.border.gray.muted,
              )
            : null,
        boxShadow: elevation,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null) ...[
            header!,
            Spacings.spacing4.hBox,
          ],
          if (body != null)
            Expanded(
              child: body!,
              flex: height != null ? 1 : 0,
            ),
          if (footer != null) ...[
            Spacings.spacing4.hBox,
            footer!,
          ]
        ],
      ),
    );
  }
}
