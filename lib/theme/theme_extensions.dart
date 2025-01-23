import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get typography => theme.textTheme;
  AppTextTheme get appTypography =>
      theme.extension<AppTextTheme>() ??
      SmallScreenTypographyImpl().appTextTheme;

  ExtendedColors? get extendedColors => theme.extension<ExtendedColors>();

  IColorTheme get colorTheme =>
      theme.extension<IColorTheme>() ?? LightColorThemeImpl();

  double widthFraction(int divisor) {
    return MediaQuery.of(this).size.width / divisor;
  }

  double heightFraction(int divisor) {
    return MediaQuery.of(this).size.height / divisor;
  }
}

extension ThemeExtensions on TextStyle? {
  TextStyle? get regular =>
      this?.copyWith(fontWeight: MortarsTheme.fontWeights.fw400);

  TextStyle? get medium =>
      this?.copyWith(fontWeight: MortarsTheme.fontWeights.fw500);

  TextStyle? get semiBold =>
      this?.copyWith(fontWeight: MortarsTheme.fontWeights.fw600);

  TextStyle? get bold =>
      this?.copyWith(fontWeight: MortarsTheme.fontWeights.fw700);

  TextStyle? setColor(Color color) {
    return this?.copyWith(color: color);
  }

  TextStyle? fontSize(double fontSize) {
    return this?.copyWith(fontSize: fontSize);
  }
}

extension DimensionExtensions on num {
  double get hMul {
    // return (this * 1.37).h;
    return (this).toDouble();
  }

  double get wMul {
    // return (this * 1.27).w;
    return (this).toDouble();
  }

  double get hMulN {
    return (this).toDouble();
  }

  double get wMulN {
    return (this).toDouble();
  }

  Widget get wBox {
    return SizedBox(
      width: (this).toDouble(),
    );
  }

  Widget get hBox {
    return SizedBox(
      height: (this).toDouble(),
    );
  }
}
