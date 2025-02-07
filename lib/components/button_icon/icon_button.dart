import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:flutter/material.dart';

import 'icon_styles.dart';

enum IconButtonEmphasis {
  SUBTLE,
  INTENSE,
}

enum IconButtonSize {
  LARGE(20.0),
  MEDIUM(16.0),
  SMALL(12.0);

  final double height;
  const IconButtonSize(this.height);
}

class BpIconButton extends StatefulWidget {
  final IconButtonEmphasis emphasis;
  final IconButtonSize size;
  final bool isDisabled;
  final bool isActive;
  final Widget? icon;
  final VoidCallback? onTap;

  const BpIconButton({
    required this.size,
    required this.emphasis,
    this.isDisabled = false,
    this.isActive = false,
    this.onTap,
    this.icon,
    super.key,
  });

  const BpIconButton.subtle({
    required this.size,
    this.isDisabled = false,
    this.isActive = false,
    this.onTap,
    this.icon,
    super.key,
  }) : emphasis = IconButtonEmphasis.INTENSE;

  const BpIconButton.intense({
    required this.size,
    this.isDisabled = false,
    this.isActive = false,
    this.onTap,
    this.icon,
    super.key,
  }) : emphasis = IconButtonEmphasis.SUBTLE;

  @override
  State<BpIconButton> createState() => _BpIconButtonState();

  static final Map<BuildContext, ValueNotifier<bool>> _hoverStateMap = {};
}

class _BpIconButtonState extends State<BpIconButton> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_updateFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_updateFocus);
    _focusNode.dispose();
    super.dispose();
  }

  void _updateFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final properties = ButtonIconProperties.fromContext(context);

    final ButtonIconStateColors btnLinkTheme =
    properties.stateColors(widget.emphasis);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _updateHover(context, true),
      onExit: (_) => _updateHover(context, false),
      child: GestureDetector(
        onTap: widget.isDisabled
            ? null
            : () {
          widget.onTap?.call();
        },
        child: Focus(
          focusNode: _focusNode,
          child: ValueListenableBuilder<bool>(
            valueListenable: _hoverState(context),
            builder: (context, isHovered, _) {
              Color color;
              if (widget.isActive) {
                color = btnLinkTheme.active.icon;
              }
              if (widget.isDisabled) {
                color = btnLinkTheme.disabledColor.icon;
              }else if (_focusNode.hasFocus) {
                color = btnLinkTheme.focusColor.icon;
              } else if (isHovered) {
                color = btnLinkTheme.hoverColor.icon;
              } else {
                color = btnLinkTheme.defaultColor.icon;
              }

              return Container(
                decoration: _focusNode.hasFocus
                    ? BoxDecoration(
                  border: Border.all(
                    color: btnLinkTheme.focusColor.focusBorder!,
                    width: Borders.widths.thicker,
                  ),
                  borderRadius: Borders.radii.medium,
                )
                    : null,
                child: IconTheme(
                  data: IconThemeData(
                    size: widget.size.height,
                    color: color,
                  ),
                  child: widget.icon!,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ValueNotifier<bool> _hoverState(BuildContext context) {
    return BpIconButton._hoverStateMap.putIfAbsent(
        context, () => ValueNotifier<bool>(false));
  }

  void _updateHover(BuildContext context, bool isHovered) {
    if (isHovered) {
      _focusNode.unfocus();
    }
    _hoverState(context).value = isHovered;
  }
}