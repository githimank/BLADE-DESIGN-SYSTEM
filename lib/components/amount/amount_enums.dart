import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

enum AmountWeight {
  SEMIBOLD,
  MEDIUM,
  REGULAR;

  TextStyle? fontWeight(TextStyle textStyle) {
    return switch (this) {
      AmountWeight.SEMIBOLD => textStyle.semiBold,
      AmountWeight.MEDIUM => textStyle.medium,
      AmountWeight.REGULAR => textStyle.regular,
    };
  }
}

enum AmountSize {
  XXLARGE,
  XLARGE,
  LARGE,
  MEDIUM,
  SMALL,
  XSMALL;

  TextStyle textStyleForDisplay(BuildContext context) => switch (this) {
        AmountSize.XXLARGE => context.appTypography.displayXLarge,
        AmountSize.XLARGE => context.appTypography.displayXLarge,
        AmountSize.LARGE => context.appTypography.displayLarge,
        AmountSize.MEDIUM => context.appTypography.displayMedium,
        AmountSize.SMALL => context.appTypography.displaySmall,
        AmountSize.XSMALL => context.appTypography.displaySmall
      };

  TextStyle textStyleForHeading(BuildContext context) => switch (this) {
        AmountSize.XXLARGE => context.appTypography.heading2XLarge,
        AmountSize.XLARGE => context.appTypography.headingXLarge,
        AmountSize.LARGE => context.appTypography.headingLarge,
        AmountSize.MEDIUM => context.appTypography.headingMedium,
        AmountSize.SMALL => context.appTypography.headingSmall,
        AmountSize.XSMALL => context.appTypography.headingSmall,
      };

  TextStyle textStyleForBody(BuildContext context) => switch (this) {
        AmountSize.XXLARGE => context.appTypography.bodyLarge,
        AmountSize.XLARGE => context.appTypography.bodyLarge,
        AmountSize.LARGE => context.appTypography.bodyLarge,
        AmountSize.MEDIUM => context.appTypography.bodyMedium,
        AmountSize.SMALL => context.appTypography.bodySmall,
        AmountSize.XSMALL => context.appTypography.bodyXSmall,
      };
}

enum AmountType {
  HEADING,
  BODY,
  DISPLAY,
}

enum AmountSuffix {
  NONE,
  DECIMALS,
  HUMANIZE,
}

enum AmountCurrencyIndicator {
  SYMBOL('₹'),
  CODE('INR');

  final String value;

  const AmountCurrencyIndicator(this.value);
}

enum AmountDenomination {
  Thousand,
  Lacs,
  Million,
  Billion,
  Trillion,
  Crore,
}

extension AmountDenominationExtension on AmountDenomination {
  String get abbreviation => switch (this) {
        AmountDenomination.Thousand => 'k',
        AmountDenomination.Lacs => 'L',
        AmountDenomination.Million => 'M',
        AmountDenomination.Billion => 'B',
        AmountDenomination.Trillion => 'T',
        AmountDenomination.Crore => 'Cr',
      };
}

enum AmountCurrencyPosition {
  LEFT,
  RIGHT,
}
