import 'font_size.dart';

class FontSizeScale {
  final double fs25;
  final double fs50;
  final double fs75;
  final double fs100;
  final double fs200;
  final double fs300;
  final double fs400;
  final double fs500;
  final double fs600;
  final double fs700;
  final double fs800;
  final double fs900;
  final double fs1000;
  final double fs1100;

  static FontSizeScale desktopScale = FontSizeScale._(
    fs25: GFontSize.globalFz10,
    fs50: GFontSize.globalFz11,
    fs75: GFontSize.globalFz12,
    fs100: GFontSize.globalFz14,
    fs200: GFontSize.globalFz16,
    fs300: GFontSize.globalFz18,
    fs400: GFontSize.globalFz20,
    fs500: GFontSize.globalFz24,
    fs600: GFontSize.globalFz32,
    fs700: GFontSize.globalFz40,
    fs800: GFontSize.globalFz48,
    fs900: GFontSize.globalFz56,
    fs1000: GFontSize.globalFz64,
    fs1100: GFontSize.globalFz72,
  );
  static FontSizeScale mobileScale = FontSizeScale._(
    fs25: GFontSize.globalFz10,
    fs50: GFontSize.globalFz11,
    fs75: GFontSize.globalFz12,
    fs100: GFontSize.globalFz14,
    fs200: GFontSize.globalFz16,
    fs300: GFontSize.globalFz16,
    fs400: GFontSize.globalFz18,
    fs500: GFontSize.globalFz20,
    fs600: GFontSize.globalFz24,
    fs700: GFontSize.globalFz32,
    fs800: GFontSize.globalFz34,
    fs900: GFontSize.globalFz36,
    fs1000: GFontSize.globalFz38,
    fs1100: GFontSize.globalFz40,
  );

  FontSizeScale._({
    required this.fs25,
    required this.fs50,
    required this.fs75,
    required this.fs100,
    required this.fs200,
    required this.fs300,
    required this.fs400,
    required this.fs500,
    required this.fs600,
    required this.fs700,
    required this.fs800,
    required this.fs900,
    required this.fs1000,
    required this.fs1100,
  });
}
