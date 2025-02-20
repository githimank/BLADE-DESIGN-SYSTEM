import 'package:blade_design_system/components/chip/bp_chip_enums.dart';
import 'package:blade_design_system/components/chip/bp_chip_style.dart';
import 'package:blade_design_system/components/chip/bp_filter_chip.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpChipData<T> {
  final T value;
  final String label;
  final Widget? icon;
  final bool isDisabled;
  final ChipIntent intent;

  BpChipData({
    required this.value,
    required this.label,
    this.icon,
    this.isDisabled = false,
    this.intent = ChipIntent.PRIMARY,
  });
}

class BpChipGroup<T> extends StatelessWidget {
  final bool isRequired;
  final List<T>? selectedValue;
  final String? label;
  final ChipLabelPosition labelPosition;
  final ChipNecessityIndicator necessityIndicator;
  final ChipValidationState validationState;
  final String? errorText;
  final String? helpText;
  final bool isDisabled;
  final ValueChanged<List<T>>? onChange;
  final ChipSize size;
  final ChipIntent color;
  final ChipSelectionType selectionType;
  final List<BpChipData> children;

  const BpChipGroup({
    super.key,
    this.isRequired = false,
    this.selectedValue,
    this.label,
    this.labelPosition = ChipLabelPosition.Top,
    this.necessityIndicator = ChipNecessityIndicator.NONE,
    this.validationState = ChipValidationState.NONE,
    this.errorText,
    this.helpText,
    this.isDisabled = false,
    this.onChange,
    this.size = ChipSize.SMALL,
    this.color = ChipIntent.PRIMARY,
    this.selectionType = ChipSelectionType.SINGLE,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Color requiredOptionColor =
    necessityIndicator == ChipNecessityIndicator.REQUIRED
        ? context.colorTheme.feedback.text.negative.intense
        : context.colorTheme.surface.text.gray.muted;

    Widget labelWidget = label != null && label!.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: necessityIndicator == ChipNecessityIndicator.REQUIRED
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            label ?? '',
            style: context.appTypography.bodySmall.semiBold?.copyWith(
              color: context.colorTheme.surface.text.gray.subtle,
              fontSize: 16,
            ),
          ),
          if (necessityIndicator != ChipNecessityIndicator.NONE)
            Text(
              necessityIndicator.value,
              style: TextStyle(
                color: requiredOptionColor,
                fontSize: necessityIndicator == ChipNecessityIndicator.REQUIRED ? 16 : 11,
              ),
            ),
        ],
      ),
    )
        : const SizedBox.shrink();

    Widget chipsWidget = Wrap(
      spacing: Spacings.spacing3,
      runSpacing: Spacings.spacing3,
      children: children.map((child) {
        return BpFilterChip(
          icon: child.icon,
          label: child.label,
          isChecked: selectionType == ChipSelectionType.SINGLE
              ? selectedValue?.contains(child.value) == true
              : selectedValue?.contains(child.value) ?? false,
          isDisabled: isDisabled || child.isDisabled,
          onSelected: (isSelected) {
            final valueList = List<T>.from(selectedValue ?? []);
            if (selectionType == ChipSelectionType.SINGLE) {
              if (isSelected) {
                valueList.clear();
                valueList.add(child.value);
              }
            } else {
              if (isSelected) {
                valueList.add(child.value);
              } else {
                valueList.remove(child.value);
              }
            }
            if (isRequired && valueList.isEmpty) {
              onChange?.call(valueList);
            } else {
              onChange?.call(valueList);
            }
          },
          chipSize: size,
          intent: child.intent,
        );
      }).toList(),
    );

    Widget _buildHelpText() {
      if (helpText == null || helpText!.isEmpty || validationState == ChipValidationState.ERROR) {
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
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    Widget _buildErrorText() {
      if (isRequired && (selectedValue == null || selectedValue!.isEmpty)) {
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
                    color: context.colorTheme.feedback.text.negative.intense,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (labelPosition == ChipLabelPosition.Top) ...[
          labelWidget,
          chipsWidget,
          _buildHelpText(),
          _buildErrorText(),
        ] else ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelWidget,
              Spacings.spacing3.wBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  chipsWidget,
                  _buildHelpText(),
                  _buildErrorText(),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }
}
