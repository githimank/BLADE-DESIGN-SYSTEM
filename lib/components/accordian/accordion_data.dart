import 'package:flutter/material.dart';

class AccordionData {
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? leading;
  final bool isDisabled;
  final bool isInitiallyExpanded;
  final ValueChanged<int?>? onExpandChange;
  final Widget? header;
  final Widget? body;
  final Widget? trailing;
  final Widget? titleSuffix;

  AccordionData(
      {this.title,
      this.subtitle,
      this.description,
      this.leading,
      this.isDisabled = false,
      this.onExpandChange,
      this.isInitiallyExpanded = false,
      this.header,
      this.body,
      this.trailing,
      this.titleSuffix})
      : assert(title != null || header != null,
            'Either title or header must not be null.');
}
