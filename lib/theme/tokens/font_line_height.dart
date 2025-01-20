class GlobalLineHeight {
  static const double globalLh00 = 0;
  static const double globalLh14 = 14;
  static const double globalLh16 = 16;
  static const double globalLh18 = 18;
  static const double globalLh20 = 20;
  static const double globalLh22 = 22;
  static const double globalLh24 = 24;
  static const double globalLh26 = 26;
  static const double globalLh32 = 32;
  static const double globalLh38 = 38;
  static const double globalLh40 = 40;
  static const double globalLh42 = 42;
  static const double globalLh46 = 46;
  static const double globalLh48 = 48;
  static const double globalLh56 = 56;
  static const double globalLh64 = 64;
  static const double globalLh70 = 70;
  static const double globalLh78 = 78;
}

class LineHeightScale {
  final double lh00;
  final double lh25;
  final double lh50;
  final double lh75;
  final double lh100;
  final double lh200;
  final double lh300;
  final double lh400;
  final double lh500;
  final double lh600;
  final double lh700;
  final double lh800;
  final double lh900;
  final double lh1000;
  final double lh1100;

  const LineHeightScale._({
    required this.lh00,
    required this.lh25,
    required this.lh50,
    required this.lh75,
    required this.lh100,
    required this.lh200,
    required this.lh300,
    required this.lh400,
    required this.lh500,
    required this.lh600,
    required this.lh700,
    required this.lh800,
    required this.lh900,
    required this.lh1000,
    required this.lh1100,
  });

  static const LineHeightScale desktopScale = LineHeightScale._(
    lh00: GlobalLineHeight.globalLh00,
    lh25: GlobalLineHeight.globalLh14,
    lh50: GlobalLineHeight.globalLh16,
    lh75: GlobalLineHeight.globalLh18,
    lh100: GlobalLineHeight.globalLh20,
    lh200: GlobalLineHeight.globalLh24,
    lh300: GlobalLineHeight.globalLh24,
    lh400: GlobalLineHeight.globalLh26,
    lh500: GlobalLineHeight.globalLh32,
    lh600: GlobalLineHeight.globalLh38,
    lh700: GlobalLineHeight.globalLh46,
    lh800: GlobalLineHeight.globalLh56,
    lh900: GlobalLineHeight.globalLh64,
    lh1000: GlobalLineHeight.globalLh70,
    lh1100: GlobalLineHeight.globalLh78,
  );

  static const LineHeightScale mobileScale = LineHeightScale._(
    lh00: GlobalLineHeight.globalLh00,
    lh25: GlobalLineHeight.globalLh14,
    lh50: GlobalLineHeight.globalLh16,
    lh75: GlobalLineHeight.globalLh18,
    lh100: GlobalLineHeight.globalLh20,
    lh200: GlobalLineHeight.globalLh24,
    lh300: GlobalLineHeight.globalLh22,
    lh400: GlobalLineHeight.globalLh24,
    lh500: GlobalLineHeight.globalLh26,
    lh600: GlobalLineHeight.globalLh32,
    lh700: GlobalLineHeight.globalLh38,
    lh800: GlobalLineHeight.globalLh40,
    lh900: GlobalLineHeight.globalLh42,
    lh1000: GlobalLineHeight.globalLh46,
    lh1100: GlobalLineHeight.globalLh48,
  );
}
