import 'package:blade_design_system/components/checkbox/checkbox_enums.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpCheckbox extends StatefulWidget {
  final bool? isIndeterminate;
  final bool isDisabled;
  final bool isIntermediate;
  final bool isChecked;
  final CheckboxSize size;
  final String? checkBoxLabel;
  final String? helpTextCheckbox;
  final String? errorText;
  final CheckBoxValidationState checkBoxValidationState;
  final ValueChanged<bool?>? onChanged;
  final bool isRequired;

  const BpCheckbox({
    this.isIndeterminate = false,
    this.isDisabled = false,
    this.isIntermediate = false,
    this.isChecked = false,
    this.size = CheckboxSize.MEDIUM,
    this.checkBoxLabel,
    this.helpTextCheckbox,
    this.errorText,
    this.checkBoxValidationState = CheckBoxValidationState.NONE,
    required this.onChanged,
    this.isRequired = false,
    super.key,
  });

  @override
  State<BpCheckbox> createState() => _BpCheckboxState();
}

class _BpCheckboxState extends State<BpCheckbox> {
  bool? isIndeterminate;
  FocusNode _focusNode = FocusNode();
  String? validationError;

  @override
  void initState() {
    super.initState();
    _updateIndeterminateState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant BpCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChecked != oldWidget.isChecked ||
        widget.isIndeterminate != oldWidget.isIndeterminate) {
      _updateIndeterminateState();
    }
  }

  void _updateIndeterminateState() {
    if (widget.isChecked) {
      isIndeterminate = true;
    } else if (widget.isIndeterminate == true) {
      isIndeterminate = null;
    } else {
      isIndeterminate = widget.isIndeterminate;
    }
  }

  String? _validateCheckbox(bool? value) {
    if (widget.isRequired && value != true) {
      return widget.errorText ?? 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = _focusNode.hasFocus
        ? context.colorTheme.surface.border.primary.muted
        : context.colorTheme.interactive.border.gray.defaultColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.scale(
              scale: widget.size.size,
              child: SizedBox(
                  width: 10,
                  height: 10,
                child: Checkbox(
                  focusNode: _focusNode,
                  shape: RoundedRectangleBorder(
                    borderRadius: Borders.radii.medium,
                  ),
                  side: widget.checkBoxValidationState ==
                      CheckBoxValidationState.ERROR
                      ? null
                      : BorderSide(
                    color: borderColor,
                    width: Borders.widths.thicker,
                  ),
                  activeColor: widget.checkBoxValidationState ==
                      CheckBoxValidationState.ERROR
                      ? null
                      : context
                      .colorTheme.interactive.background.primary.defaultColor,
                  focusColor: context.colorTheme.transparent,
                  hoverColor: context.colorTheme.transparent,
                  tristate: isIndeterminate == null ? true : false,
                  isError: widget.checkBoxValidationState ==
                      CheckBoxValidationState.ERROR
                      ? true
                      : false,
                  value: widget.isChecked ? true : isIndeterminate,
                  onChanged: widget.isDisabled
                      ? null
                      : (bool? value) {
                    setState(
                          () {
                        if (widget.isChecked) {
                          isIndeterminate = true;
                        } else if (widget.isIntermediate) {
                          if (isIndeterminate == false) {
                            isIndeterminate = null;
                          } else if (isIndeterminate == null) {
                            isIndeterminate = false;
                          } else {
                            isIndeterminate = false;
                          }
                        } else {
                          if (isIndeterminate == null) {
                            isIndeterminate = null;
                          } else {
                            isIndeterminate = value;
                          }
                        }

                        if (widget.onChanged != null) {
                          widget.onChanged!(value);
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            Spacings.spacing3.wBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.checkBoxLabel != null &&
                    widget.checkBoxLabel!.isNotEmpty)
                  Text(
                    widget.checkBoxLabel ?? '',
                    style: widget.size.textStyle(context),
                  ),
              ],
            ),
          ],
        ),
        if (widget.helpTextCheckbox != null &&
            widget.helpTextCheckbox!.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              widget.helpTextCheckbox ?? '',
              style: widget.size.textStyleForErrorAndHelper(context).copyWith(
                  color: context.colorTheme.surface.text.gray.muted),
            ),
          ),
        ],
        if (validationError != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: context.colorTheme.feedback.text.negative.intense,
                  size: 11,
                ),
                Spacings.spacing2.wBox,
                Flexible(
                  child: Text(
                    validationError!,
                    style: widget.size.textStyleForErrorAndHelper(context).copyWith(
                        color:
                        context.colorTheme.feedback.text.negative.intense),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
