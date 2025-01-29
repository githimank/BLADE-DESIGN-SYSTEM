import 'package:blade_design_system/theme/blade_theme.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder xSWidgetBuilder;
  final WidgetBuilder? sWidgetBuilder;
  final WidgetBuilder? mWidgetBuilder;
  final WidgetBuilder? lWidgetBuilder;
  final WidgetBuilder? xLWidgetBuilder;

  const ResponsiveBuilder({
    required this.xSWidgetBuilder,
    this.sWidgetBuilder,
    this.mWidgetBuilder,
    this.lWidgetBuilder,
    this.xLWidgetBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final breakPoint = BladeTheme.currentBreakpoint;

    switch (breakPoint) {
      case Breakpoint.XS:
        return xSWidgetBuilder(context);
      case Breakpoint.S:
        return sWidgetBuilder?.call(context) ?? xSWidgetBuilder(context);
      case Breakpoint.M:
        return mWidgetBuilder?.call(context) ?? xSWidgetBuilder(context);
      case Breakpoint.L:
        return lWidgetBuilder?.call(context) ?? xSWidgetBuilder(context);
      case Breakpoint.XL:
        return xLWidgetBuilder?.call(context) ?? xSWidgetBuilder(context);
    }
  }
}
