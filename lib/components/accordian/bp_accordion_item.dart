import 'package:blade_design_system/components/accordian/accordion_enum.dart';
import 'package:blade_design_system/components/accordian/accordion_header.dart';
import 'package:blade_design_system/components/accordian/bp_accordion_body.dart';
import 'package:flutter/material.dart';

class BpAccordionItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? icon;
  final AccordionSize size;
  final bool isDisabled;
  final int? index;
  final bool showNumberPrefix;
  final bool isExpanded;
  final ValueChanged<int?>? onExpandChange;
  final Widget? header;
  final Widget? body;
  final Widget? trailing;
  final Widget? titleSuffix;

  const BpAccordionItem({
    super.key,
    required this.size,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.isDisabled = false,
    this.index,
    this.isExpanded = false,
    this.showNumberPrefix = false,
    this.onExpandChange,
    this.header,
    this.body,
    this.trailing,
    this.titleSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BpAccordionHeader(
            headerData: AccordionHeaderData(
                title: title,
                subtitle: subtitle,
                leading: icon,
                titleWidget: header,
                trailing: trailing,
                titleSuffix: titleSuffix,
                onTap: () {
                  onExpandChange?.call(index);
                },
                isDisabled: isDisabled,
                showNumberPrefix: showNumberPrefix,
                index: index,
                isExpanded: isExpanded,
                size: size)),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: BpAccordionBody(
            size: size,
            description: description,
            child: body,
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        if (index != null)
          const Divider(
            height: 0,
          ),
      ],
    );
  }
}
