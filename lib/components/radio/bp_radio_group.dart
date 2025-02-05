import 'package:flutter/material.dart';
import 'package:mortars_design_system/components/radio/bp_enums.dart';
import 'package:mortars_design_system/components/radio/bp_radio.dart';
import 'package:mortars_design_system/theme/theme_extensions.dart';
import 'package:mortars_design_system/theme/tokens/spacing.dart';

class BpRadioData<T> {
  final String label;
  final T value;

  BpRadioData({
    required this.label,
    required this.value,
  });
}

class RadioGroup<T> extends StatelessWidget {
  final List<BpRadioData> children;
  final T? selectedValue;
  final String? label;
  final String? helpText;
  final String? errorText;
  final RadioValidationState validationState;
  final RadioNecessityIndicator necessityIndicator;
  final bool isDisabled;
  final bool isRequired;
  final Function(T?)? onChanged;
  final RadioSize size;
  final Axis axis;
  final double? labelOptionGap;
  final double? optionGapHorizontal;
  final double? optionGapVertical;
  final double? maxWidthForLabel;
  final double? maxWidthForOption;

  const RadioGroup({
    super.key,
    required this.children,
    this.label,
    this.helpText,
    this.errorText,
    this.validationState = RadioValidationState.NONE,
    this.necessityIndicator = RadioNecessityIndicator.NONE,
    this.isDisabled = false,
    this.isRequired = false,
    this.onChanged,
    this.size = RadioSize.MEDIUM,
    this.selectedValue,
    this.axis = Axis.vertical,
    this.labelOptionGap = Spacings.spacing2,
    this.optionGapHorizontal = Spacings.spacing3,
    this.optionGapVertical = Spacings.spacing3,
    this.maxWidthForLabel = 200.0,
    this.maxWidthForOption = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    Color requiredOptionColor =
        necessityIndicator == RadioNecessityIndicator.REQUIRED
            ? context.colorTheme.feedback.text.negative.intense
            : context.colorTheme.surface.text.gray.muted;

    Widget labelWidget = label != null && label!.isNotEmpty
        ? ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidthForLabel ?? 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  necessityIndicator == RadioNecessityIndicator.REQUIRED
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    label ?? '',
                    style: size.textStyleForLabel(context).copyWith(
                          color: context.colorTheme.surface.text.gray.subtle,
                        ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
                if (necessityIndicator != RadioNecessityIndicator.NONE)
                  Text(
                    necessityIndicator.value,
                    style: TextStyle(
                      color: requiredOptionColor,
                      fontSize:
                          necessityIndicator == RadioNecessityIndicator.REQUIRED
                              ? 16
                              : 11,
                    ),
                  ),
              ],
            ),
          )
        : const SizedBox.shrink();

    Widget buildHelpText() {
      if (helpText == null ||
          helpText!.isEmpty ||
          validationState == RadioValidationState.ERROR) {
        return const SizedBox.shrink();
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacings.spacing2.wBox,
          Text(
            helpText ?? '',
            style: size.textStyleForErrorAndHelper(context).copyWith(
                  color: context.colorTheme.surface.text.gray.muted,
                ),
          ),
        ],
      );
    }

    Widget buildErrorText() {
      if (isRequired && (selectedValue == null)) {
        return Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: context.colorTheme.feedback.text.negative.intense,
                size: 15,
              ),
              Spacings.spacing2.wBox,
              Flexible(
                child: Text(
                  errorText ?? 'This field is required',
                  style: size.textStyleForErrorAndHelper(context).copyWith(
                        color:
                            context.colorTheme.feedback.text.negative.intense,
                      ),
                ),
              ),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    }

    List<Widget> generateChildren() {
      return children.map((child) {
        return Padding(
          padding: axis == Axis.vertical
              ? EdgeInsets.only(bottom: optionGapVertical ?? 0.0)
              : EdgeInsets.only(right: optionGapHorizontal ?? 0.0),
          child: BpRadio(
            maxWidthForOptionLabel: maxWidthForOption,
            label: child.label,
            isDisabled: isDisabled,
            isSelected: selectedValue == child.value,
            onChanged: (value) {
              if (value) {
                onChanged?.call(child.value);
              }
              //TODO Removed to Unselect radio
              // else {
              //   onChanged?.call(null);
              // }
            },
            validationState: validationState,
            size: size,
          ),
        );
      }).toList();
    }

    return axis == Axis.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelWidget,
              ...generateChildren(),
              buildHelpText(),
              buildErrorText(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelWidget,
                  SizedBox(
                    width: labelOptionGap,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: generateChildren(),
                  ),
                ],
              ),
              buildHelpText(),
              buildErrorText(),
            ],
          );
  }
}
