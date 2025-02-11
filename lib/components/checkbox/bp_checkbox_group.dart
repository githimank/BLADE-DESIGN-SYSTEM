import 'package:blade_design_system/components/checkbox/checkbox_enums.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'bp_checkbox.dart';

class CheckboxData<T> {
  final T Key;
  final String checkBoxLabel;
  final bool isDisabled;

  CheckboxData({
    required this.Key,
    required this.checkBoxLabel,
    this.isDisabled = false,
  });
}

class BpCheckboxGroup<T> extends StatefulWidget {
  final String? label;
  final String? errorText;
  final String? helpText;
  final bool isRequired;
  final bool isDisabled;
  final String? defaultValue;
  final ValueChanged<List<T>>? onChange;
  final CheckboxSize size;
  final List<CheckboxData> children;
  final CheckboxNecessityIndicator necessityIndicator;
  final CheckBoxValidationState validationState;

  const BpCheckboxGroup({
    super.key,
    this.label,
    this.errorText,
    this.helpText,
    this.isRequired = false,
    this.isDisabled = false,
    this.defaultValue,
    this.onChange,
    this.size = CheckboxSize.MEDIUM,
    this.necessityIndicator = CheckboxNecessityIndicator.NONE,
    required this.children,
    this.validationState = CheckBoxValidationState.NONE,
  });

  @override
  _BpCheckboxGroupState<T> createState() => _BpCheckboxGroupState<T>();
}

class _BpCheckboxGroupState<T> extends State<BpCheckboxGroup<T>> {
  List<T> selectedValues = [];

  void _onCheckboxChanged(T value, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedValues.add(value);
      } else {
        selectedValues.remove(value);
      }
      widget.onChange?.call(selectedValues);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showError = widget.errorText != null && widget.errorText!.isNotEmpty;
    Color requiredOptionColor =
    widget.necessityIndicator == CheckboxNecessityIndicator.REQUIRED
        ? context.colorTheme.feedback.text.negative.intense
        : context.colorTheme.surface.text.gray.muted;

    Widget labelWidget = widget.label != null && widget.label!.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: widget.necessityIndicator == CheckboxNecessityIndicator.REQUIRED
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            widget.label ?? '',
            style: context.appTypography.bodySmall.semiBold?.copyWith(
              color: context.colorTheme.surface.text.gray.subtle,
              fontSize: 16,
            ),
          ),
          if (widget.necessityIndicator != CheckboxNecessityIndicator.NONE)
            Text(
              widget.necessityIndicator.value,
              style: TextStyle(
                color: requiredOptionColor,
                fontSize: widget.necessityIndicator == CheckboxNecessityIndicator.REQUIRED ? 16 : 11,
              ),
            ),
        ],
      ),
    )
        : const SizedBox.shrink();

    Widget _buildHelpText() {
      if (widget.helpText == null || widget.helpText!.isEmpty || widget.validationState == CheckBoxValidationState.ERROR) {
        return const SizedBox.shrink();
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacings.spacing2.wBox,
          Text(
            widget.helpText ?? '',
            style: widget.size.textStyleForErrorAndHelper(context).copyWith(
              color: context.colorTheme.surface.text.gray.muted,
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    Widget _buildErrorText() {
      if (widget.isRequired && (selectedValues.isEmpty)) {
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
              Text(
                widget.errorText ?? 'This field is required',
                maxLines: 2,
                style: widget.size.textStyleForErrorAndHelper(context).copyWith(
                  color: context.colorTheme.feedback.text.negative.intense,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelWidget,
              Wrap(
                spacing: Spacings.spacing2,
                runSpacing: Spacings.spacing2,
                direction: Axis.vertical,
                children: widget.children.map((child) {
                  return BpCheckbox(
                    isDisabled: widget.isDisabled || child.isDisabled,
                    checkBoxLabel: child.checkBoxLabel,
                    size: widget.size,
                    checkBoxValidationState: showError ? CheckBoxValidationState.ERROR : CheckBoxValidationState.NONE,
                    onChanged: (bool? isSelected) {
                      _onCheckboxChanged(child.Key, isSelected ?? false);
                    },
                  );
                }).toList(),
              ),
              _buildHelpText(),
              _buildErrorText(),
            ],
          ),
        ],
      ),
    );
  }
}