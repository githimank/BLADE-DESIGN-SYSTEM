import 'package:blade_design_system/components/amount/text_custom.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

import 'amount_enums.dart';

class AmountWidget extends StatelessWidget {
  final double value;
  final AmountWeight weight;
  final AmountSize size;
  final AmountType type;
  final AmountSuffix suffix;
  final AmountCurrencyIndicator currencyIndicator;
  final AmountCurrencyPosition currencyPosition;
  final bool isAffixSubtle;
  final bool isStrikethrough;
  final Color? color;

  const AmountWidget({
    super.key,
    required this.value,
    this.weight = AmountWeight.SEMIBOLD,
    this.size = AmountSize.MEDIUM,
    this.type = AmountType.BODY,
    this.suffix = AmountSuffix.DECIMALS,
    this.currencyIndicator = AmountCurrencyIndicator.SYMBOL,
    this.currencyPosition = AmountCurrencyPosition.LEFT,
    this.isAffixSubtle = true,
    this.isStrikethrough = false,
    this.color,
  });

  String _getFormattedValue() {
    String formattedValue = '';

    switch (suffix) {
      case AmountSuffix.DECIMALS:
        formattedValue = _formatDecimal(value);
        break;
      case AmountSuffix.NONE:
        formattedValue = _formatForNone(value);
        break;
      case AmountSuffix.HUMANIZE:
        formattedValue = _formatWithoutSuffix(value);
        break;
    }

    return formattedValue;
  }

  String _formatDecimal(double value) {
    return value.toStringAsFixed(2);
  }

  String _formatWithoutSuffix(double value) {
    AmountDenomination denomination;
    if (value >= 1e12) {
      denomination = AmountDenomination.Trillion;
      value /= 1e12;
    } else if (value >= 1e9) {
      denomination = AmountDenomination.Billion;
      value /= 1e9;
    } else if (value >= 1e7) {
      denomination = AmountDenomination.Crore;
      value /= 1e7;
    } else if (value >= 1e5) {
      denomination = AmountDenomination.Lacs;
      value /= 1e5;
    } else if (value >= 1e3) {
      denomination = AmountDenomination.Thousand;
      value /= 1e3;
    } else {
      return value.toStringAsFixed(0);
    }

    return '${value.toStringAsFixed(0)}${denomination.abbreviation}';
  }

  String _formatForNone(double value) {
    return value.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
          (match) => '${match[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = switch (type) {
      AmountType.HEADING => size.textStyleForHeading(context),
      AmountType.BODY => size.textStyleForBody(context),
      AmountType.DISPLAY => size.textStyleForDisplay(context),
    };

    TextStyle finalStyle = weight.fontWeight(baseStyle) ?? baseStyle;

    String currency = currencyIndicator.value;
    String formattedValue = _getFormattedValue();

    RegExp decimalRegExp = RegExp(r'(\.\d+)$');
    String? decimalValue = decimalRegExp.hasMatch(formattedValue)
        ? decimalRegExp.firstMatch(formattedValue)?.group(0)
        : null;

    String formattedValueWithoutDecimal =
    formattedValue.replaceAll(decimalRegExp, '');

    final currencyColor = color ?? context.colorTheme.surface.text.gray.normal;

    double fontSizeAdjustment = finalStyle.fontSize! * 0.2;

    TextStyle getCurrencyTextStyle() {
      return finalStyle.copyWith(
        color: currencyColor,
        fontFamily: 'Inter',
        fontSize: isAffixSubtle ? finalStyle.fontSize! * 0.7 : null,
      );
    }

    CenteredStrikethroughPainter painter;
    if (currencyPosition == AmountCurrencyPosition.LEFT) {
      painter = CenteredStrikethroughPainter(
        text1: currency,
        text2: formattedValueWithoutDecimal,
        text3: decimalValue?.toString() ?? '',
        style1: getCurrencyTextStyle().copyWith(
          color: getCurrencyTextStyle()
              .color
              ?.withOpacity(isAffixSubtle ? 0.65 : 1),
        ),
        style2: finalStyle.copyWith(
          color: currencyColor,
        ),
        style3: getCurrencyTextStyle().copyWith(
          color: getCurrencyTextStyle()
              .color
              ?.withOpacity(isAffixSubtle ? 0.65 : 1),
        ),
        strikeThroughColor: currencyColor,
        strikeThroughThickness: 1.5,
        isStrikeThrough: isStrikethrough,
      );
    } else {
      painter = CenteredStrikethroughPainter(
          text1: formattedValueWithoutDecimal,
          text2: decimalValue?.toString() ?? '',
          text3: currency,
          style1: finalStyle.copyWith(
            color: currencyColor,
          ),
          style2: getCurrencyTextStyle().copyWith(
            color: getCurrencyTextStyle()
                .color
                ?.withOpacity(isAffixSubtle ? 0.65 : 1),
          ),
          style3: getCurrencyTextStyle().copyWith(
            color: getCurrencyTextStyle()
                .color
                ?.withOpacity(isAffixSubtle ? 0.65 : 1),
          ),
          strikeThroughColor: currencyColor,
          strikeThroughThickness: 1.5,
          isStrikeThrough: isStrikethrough);
    }
    final textSize = painter.getRequiredSize();

    return CustomPaint(
      size: textSize, // Dynamically calculated size
      painter: painter,
    );
  }
}
