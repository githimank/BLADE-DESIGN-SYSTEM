import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key, required this.padding});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:  const EdgeInsets.only(
            top: Spacings.spacing4, bottom: Spacings.spacing4),
        height: 4,
        width: 56,
        decoration: BoxDecoration(
          color: context.colorTheme.interactive.background.gray.faded,
          borderRadius: BorderRadius.circular(Spacings.spacing5),
        ),
      ),
    );
  }
}