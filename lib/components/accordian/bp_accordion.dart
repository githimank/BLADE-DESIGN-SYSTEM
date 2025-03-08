import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:flutter/material.dart';

import 'accordion_data.dart';
import 'accordion_enum.dart';
import 'bp_accordion_item.dart';

class BpAccordion extends StatefulWidget {
  final List<AccordionData> accordions;
  final ValueChanged<int?>? onExpandChange;
  final AccordianVariant variant;
  final AccordionSize size;
  final bool showNumberPrefix;

  const BpAccordion(
      {super.key,
      required this.accordions,
      this.size = AccordionSize.LARGE,
      this.showNumberPrefix = false,
      this.onExpandChange,
      this.variant = AccordianVariant.TRANSPARENT});

  @override
  State<BpAccordion> createState() => _BpAccordionState();
}

class _BpAccordionState extends State<BpAccordion> {
  int expandedIndex = -1;

  @override
  void initState() {
    expandedIndex = widget.accordions.indexWhere(
      (element) => element.isInitiallyExpanded,
    );
    super.initState();
  }

  void _onExpandChange(int? index) {
    if (widget.onExpandChange != null) {
      widget.onExpandChange!(index);
    }
    setState(() {
      expandedIndex = expandedIndex == index ? -1 : index ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.variant == AccordianVariant.TRANSPARENT
              ? context.colorTheme.transparent
              : context.colorTheme.surface.background.gray.intense,
          borderRadius: Borders.radii.large,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.accordions.length, (index) {
            final data = widget.accordions[index];
            return BpAccordionItem(
                title: data.title,
                subtitle: data.subtitle,
                description: data.description,
                isExpanded: expandedIndex == index,
                isDisabled: data.isDisabled,
                onExpandChange: _onExpandChange,
                index: index,
                showNumberPrefix: widget.showNumberPrefix,
                header: data.header,
                body: data.body,
                size: widget.size,
                trailing: data.trailing,
                titleSuffix: data.titleSuffix,
                icon: data.leading);
          }),
        ));
  }
}
