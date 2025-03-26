import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class InkWellBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, Set<WidgetState> states) builder;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final bool enableFeedback;
  final bool excludeFromSemantics;
  final WidgetStateProperty<Color?>? overlayColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool canRequestFocus;
  final bool isSelected;

  const InkWellBuilder({
    super.key,
    required this.builder,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.splashFactory,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.overlayColor,
    this.focusNode,
    this.autofocus = false,
    this.canRequestFocus = true,
    this.isSelected = false,
  });

  @override
  _InkWellBuilderState createState() => _InkWellBuilderState();
}

class _InkWellBuilderState extends State<InkWellBuilder> {
  Set<WidgetState> _states = {};

  bool get isDisabled =>
      widget.onTap == null &&
      widget.onDoubleTap == null &&
      widget.onLongPress == null;

  void _updateState(WidgetState state, bool isAdding) {
    setState(() {
      if (isAdding) {
        _states.add(state);
      } else {
        _states.remove(state);
      }
    });
  }

  @override
  void initState() {
    if (isDisabled) {
      _states.add(WidgetState.disabled);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InkWellBuilder oldWidget) {
    if (isDisabled) {
      _states.add(WidgetState.disabled);
    } else {
      _states.remove(WidgetState.disabled);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : widget.onTap,
      onDoubleTap: isDisabled ? null : widget.onDoubleTap,
      onLongPress: isDisabled ? null : widget.onLongPress,
      onHover: (isHovering) {
        if (!isDisabled) {
          _updateState(WidgetState.hovered, isHovering);
          if (widget.onHover != null) {
            widget.onHover!(isHovering);
          }
        }
      },
      onFocusChange: (isFocused) {
        if (!isDisabled) {
          _updateState(WidgetState.focused, isFocused);
          if (widget.onFocusChange != null) {
            widget.onFocusChange!(isFocused);
          }
        }
      },
      mouseCursor: isDisabled
          ? SystemMouseCursors.forbidden
          : widget.mouseCursor ?? SystemMouseCursors.click,
      focusColor: widget.focusColor ?? context.colorTheme.transparent,
      hoverColor: widget.hoverColor ?? context.colorTheme.transparent,
      highlightColor: widget.highlightColor ?? context.colorTheme.transparent,
      splashColor: widget.splashColor ?? context.colorTheme.transparent,
      splashFactory: widget.splashFactory,
      borderRadius: widget.borderRadius,
      customBorder: widget.customBorder,
      enableFeedback: widget.enableFeedback,
      excludeFromSemantics: widget.excludeFromSemantics,
      overlayColor: widget.overlayColor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      canRequestFocus: widget.canRequestFocus && !isDisabled,
      onHighlightChanged: (isHighlighted) =>
          _updateState(WidgetState.pressed, isHighlighted),
      child: widget.builder(context, _states),
    );
  }
}
