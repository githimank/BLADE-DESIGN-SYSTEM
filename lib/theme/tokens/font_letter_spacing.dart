class GlobalLetterSpacing {
  static const double compressed = -2;
  static const double condensed = -1;
  static const double normal = 0;
  static const double expanded = 1;
  static const double extended = 2;
}

class LetterSpacingScale {
  final double ls50;
  final double ls100;

  const LetterSpacingScale._({required this.ls50, required this.ls100});

  static const LetterSpacingScale desktopScale = LetterSpacingScale._(
      ls50: GlobalLetterSpacing.condensed, ls100: GlobalLetterSpacing.normal);
  static const LetterSpacingScale mobileScale = LetterSpacingScale._(
      ls50: GlobalLetterSpacing.condensed, ls100: GlobalLetterSpacing.normal);
}
