import 'package:flutter/material.dart';

class BpTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const BpTooltip({
    super.key,
    required this.message,
    required this.child,
    this.backgroundColor,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(4.0),
      ),
      textStyle: textStyle ?? TextStyle(color: Colors.white),
      padding: padding ?? EdgeInsets.all(8.0),
      child: child,
    );
  }
}
