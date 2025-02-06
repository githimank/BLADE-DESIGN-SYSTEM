import 'package:blade_design_system/components/radio/radio_enum.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpRadio extends StatefulWidget {
  final String label;
  final bool isDisabled;
  final bool isSelected;
  final RadioSize size;
  final ValueChanged<bool>? onChanged;
  final RadioValidationState validationState;
  final double? maxWidthForOptionLabel;

  const BpRadio({
    Key? key,
    required this.label,
    this.isDisabled = false,
    this.isSelected = false,
    this.size = RadioSize.MEDIUM,
    this.onChanged,
    this.validationState = RadioValidationState.NONE,
    this.maxWidthForOptionLabel = 200,
  }) : super(key: key);

  @override
  _BpRadioState createState() => _BpRadioState();
}

class _BpRadioState extends State<BpRadio> {
  final Set<WidgetState> states = {};

  @override
  void initState() {
    super.initState();
    if (widget.isDisabled) {
      states.add(WidgetState.disabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double radioSize = widget.size.size;
    final bool isChecked = widget.isSelected;
    final textStyle = widget.size.textStyle(context);
    final lineHeight = ((textStyle.height ?? 0) * (textStyle.fontSize ?? 0));
    final radioPadding = (lineHeight - (textStyle.fontSize ?? 0)) / 2;

    return InkWell(
      hoverColor: context.colorTheme.transparent,
      splashColor: context.colorTheme.transparent,
      focusColor: context.colorTheme.transparent,
      highlightColor: context.colorTheme.transparent,
      onTap: widget.isDisabled || widget.onChanged == null
          ? null
          : () {
              widget.onChanged?.call(!isChecked);
            },
      onHover: (hovering) {
        if (hovering) {
          states.add(WidgetState.hovered);
        } else {
          states.remove(WidgetState.hovered);
        }
        setState(() {});
      },
      onFocusChange: (isFocused) {
        if (isFocused) {
          states.add(WidgetState.focused);
        } else {
          states.remove(WidgetState.focused);
        }
        setState(() {});
      },
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: widget.maxWidthForOptionLabel ?? 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: radioPadding),
              decoration: states.contains(WidgetState.focused)
                  ? BoxDecoration(
                      border: Border.all(
                        color: context.colorTheme.surface.border.primary.muted,
                        width: Borders.widths.thicker,
                      ),
                      borderRadius: Borders.radii.max,
                    )
                  : null,
              child: Container(
                width: radioSize,
                height: radioSize,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: Borders.widths.thick,
                      color: radioBorderColor,
                    ),
                    color: bgColor),
                child: isChecked
                    ? Icon(
                        Icons.circle,
                        color: context
                            .colorTheme.interactive.icon.onPrimary.normal,
                        size: widget.size == RadioSize.LARGE
                            ? radioSize * 0.6
                            : radioSize * 0.4,
                      )
                    : null,
              ),
            ),
            Spacings.spacing2.wBox,
            Flexible(
              child: Text(
                widget.label,
                style: widget.size.textStyle(context).copyWith(
                    color: context.colorTheme.surface.text.gray.subtle),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get radioBorderColor {
    Color borderColor;

    if (widget.validationState == RadioValidationState.ERROR) {
      borderColor = context.colorTheme.interactive.border.negative.defaultColor;
    } else if (widget.isSelected) {
      if (widget.isDisabled) {
        borderColor = context.colorTheme.transparent;
      } else {
        borderColor =
            context.colorTheme.interactive.border.primary.defaultColor;
      }
    } else {
      if (widget.isDisabled) {
        borderColor = context.colorTheme.interactive.border.gray.disabled;
      } else {
        borderColor = context.colorTheme.interactive.border.gray.defaultColor;
      }
    }
    return borderColor;
  }

  Color get bgColor {
    if (widget.isSelected) {
      if (widget.isDisabled) {
        return context.colorTheme.interactive.background.primary.disabled;
      } else if (widget.validationState == RadioValidationState.ERROR) {
        return context.colorTheme.interactive.background.negative.defaultColor;
      } else {
        return context.colorTheme.interactive.background.primary.defaultColor;
      }
    }
    return Colors.transparent;
  }
}
