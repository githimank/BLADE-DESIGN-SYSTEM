import 'package:flutter/material.dart';

import 'accordion_enum.dart';

class AccordionHeaderData {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? titleWidget;
  final Widget? trailing;
  final Widget? titleSuffix;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool showNumberPrefix;
  final int? index;
  final bool isExpanded;
  final AccordionSize size;

  const AccordionHeaderData(
      {required this.title,
      required this.subtitle,
      required this.leading,
      required this.titleWidget,
      required this.trailing,
      required this.titleSuffix,
      required this.onTap,
      required this.isDisabled,
      required this.showNumberPrefix,
      required this.index,
      required this.isExpanded,
      required this.size});
}

