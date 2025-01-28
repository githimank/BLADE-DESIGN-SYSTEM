import 'package:flutter/material.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    required this.themeData,
    required this.toggleTheme,
    required super.child,
    super.key,
  });

  final ThemeData themeData;
  final Function() toggleTheme;

  @override
  bool updateShouldNotify(covariant AppThemeProvider oldWidget) {
    return themeData != oldWidget.themeData;
  }

  static AppThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
  }
}
