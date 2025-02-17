import 'package:blade_design_system/components/chip/bp_chip_enums.dart';
import 'package:blade_design_system/components/chip/bp_chip_style.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:flutter/material.dart';

class BpFilterChip extends StatefulWidget {
  final String label;
  final Widget? icon;
  final bool isDisabled;
  final ChipSize chipSize;
  final bool isChecked;
  final ChipIntent intent;
  final ValueChanged<bool> onSelected;

  const BpFilterChip({
    super.key,
    required this.label,
    this.icon,
    this.isDisabled = false,
    required this.onSelected,
    this.chipSize = ChipSize.MEDIUM,
    this.isChecked = false,
    this.intent = ChipIntent.PRIMARY,
  });

  @override
  _BpFilterChipState createState() => _BpFilterChipState();
}

class _BpFilterChipState extends State<BpFilterChip> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
  void didUpdateWidget(covariant BpFilterChip oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final chipStyle = widget.chipSize.textStyle(context);
    final scale = widget.chipSize.size;

    final chipStyleData = ChipStyle.getStyle(
      widget.intent,
      widget.isDisabled,
      widget.isChecked,
      context,
    );

    Color borderColor = _focusNode.hasFocus
        ? context.colorTheme.surface.border.primary.muted
        : chipStyleData.borderColor;

    return Theme(
      data: ThemeData(
        hoverColor: context.colorTheme.transparent,
        focusColor: context.colorTheme.transparent,
        splashColor: context.colorTheme.transparent,
      ),
      child: FilterChip(
        padding: EdgeInsets.symmetric(vertical: widget.chipSize.verticalPadding, horizontal: widget.chipSize.horizontalPadding),
        focusNode: _focusNode,
        labelPadding: EdgeInsets.zero,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconTheme(
                  data: IconThemeData(color: chipStyleData.iconColor),
                  child: widget.icon!,
                ),
              ),
            Text(
              widget.label,
              style: chipStyle.copyWith(color: chipStyleData.textColor),
            ),
          ],
        ),
        selected: widget.isChecked,
        showCheckmark: false,
        onSelected: widget.isDisabled
            ? null
            : (selected) {
                widget.onSelected(selected);
              },
        selectedColor: chipStyleData.selectedColor,
        color: WidgetStateProperty.resolveWith((states){
          if(states.contains(WidgetState.focused)){
            return chipStyleData.focusedColor;
          }
          if(states.contains(WidgetState.hovered)){
            return chipStyleData.hoverColor;
          }
          else{
            return chipStyleData.background;
          }
        }),
        disabledColor: widget.isChecked ? chipStyleData.disabledColor : widget.isDisabled ? null : chipStyleData.disabledColor,

        //TODO Work on FocussedOutlineBorder
        // shape: FocussedOutlineBorder(
        //   borderRadius: Borders.radii.max,
        //   outerColor: _focusNode.hasFocus ? context.colorTheme.surface.border.primary.muted : context.colorTheme.transparent,
        //   innerColor: chipStyleData.borderColor,
        //   outerWidth: Borders.widths.thicker*2,
        //   innerWidth: Borders.widths.thinner,
        // ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: Borders.radii.max,
        ),
        side: BorderSide(
          color: borderColor,
          width: Borders.widths.thick,
        ),
      ),
    );
  }
}
