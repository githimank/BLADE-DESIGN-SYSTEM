import 'package:blade_design_system/components/spinner/bp_circular_progress_indicator.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'button_properties.dart';

class ButtonWidget extends StatefulWidget {
  final ButtonVariant variant;
  final ButtonMood mood;
  final ButtonSize size;
  final bool isFullWidth;
  final bool isIconOnly;
  final bool isLoading;
  final bool isDisabled;
  final Widget? leading;
  final Widget? trailing;
  final Widget? icon;
  final String? label;
  final VoidCallback? onTap;

  const ButtonWidget({
    this.size = ButtonSize.MEDIUM,
    this.label,
    this.mood = ButtonMood.PRIMARY,
    this.variant = ButtonVariant.PRIMARY,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isIconOnly = false,
    this.icon,
    this.leading,
    this.trailing,
    this.isDisabled = false,
    this.onTap,
    super.key,
  });

  const ButtonWidget.primary({
    required this.size,
    this.label,
    required this.mood,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isIconOnly = false,
    this.icon,
    this.leading,
    this.trailing,
    this.isDisabled = false,
    this.onTap,
    super.key,
  }) : variant = ButtonVariant.PRIMARY;

  const ButtonWidget.secondary({
    required this.size,
    this.label,
    required this.mood,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isIconOnly = false,
    this.icon,
    this.leading,
    this.trailing,
    this.isDisabled = false,
    this.onTap,
    super.key,
  }) : variant = ButtonVariant.SECONDARY;

  const ButtonWidget.tertiary({
    required this.size,
    this.label,
    required this.mood,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isIconOnly = false,
    this.icon,
    this.leading,
    this.trailing,
    this.isDisabled = false,
    this.onTap,
    super.key,
  }) : variant = ButtonVariant.TERTIARY;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final ValueNotifier<bool> isFocused = ValueNotifier(false);
  final btnKey = GlobalKey();

  Widget _buildBorder(bool isFocused, Color focusedBorderColor) {
    if (!isFocused) {
      return const SizedBox.shrink();
    }
    final RenderBox renderBox =
        btnKey.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    return Container(
      width: size.width + 8,
      height: size.height + 8,
      decoration: BoxDecoration(
          border: Border.all(color: focusedBorderColor, width: 3),
          borderRadius: Borders.radii.medium),
    );
  }

  void _enableFocusBorder() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFocused.value = true;
    });
  }

  void _disableFocusBorder() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isFocused.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonProperties buttonProperties = switch (widget.variant) {
      ButtonVariant.PRIMARY => ButtonProperties.base(context),
      ButtonVariant.SECONDARY => ButtonProperties.secondary(context),
      ButtonVariant.TERTIARY => ButtonProperties.tertiary(context),
    };
    final ButtonStateColors btnTheme =
        buttonProperties.stateColors(widget.mood);
    Widget loader = BpCircularProgressIndicator(
      height: widget.size.loaderHeight,
      arcColor: btnTheme.loadingColor.loaderArcColor,
      trackColor: btnTheme.loadingColor.loaderTrackColor,
    );
    Widget? iconBuilder = widget.icon;
    if (iconBuilder != null && iconBuilder is Icon) {
      iconBuilder = Icon(iconBuilder.icon,
          size: iconBuilder.size,
          color: widget.isDisabled
              ? btnTheme.disabledColor.icon
              : btnTheme.defaultColor.icon);
    }
    if (widget.isFullWidth) {
      loader = Center(child: loader);
    }
    if (widget.isFullWidth && widget.isIconOnly) {
      iconBuilder = Center(
        child: widget.icon,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: isFocused,
            builder: (context, value, _) {
              return _buildBorder(
                  value, btnTheme.focusColor.focusBorder ?? Colors.transparent);
            }),
        SizedBox(
          height: widget.size.height,
          child: ElevatedButton(
            key: btnKey,
            style: ButtonStyle(
              minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
              padding: WidgetStateProperty.resolveWith((states) {
                return EdgeInsets.symmetric(
                    horizontal: widget.isIconOnly
                        ? widget.size.horizontalIconPadding
                        : widget.size.horizontalPadding);
              }),
              elevation: const WidgetStatePropertyAll(0),
              textStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  final style = widget.size.textStyle(context);
                  return style.copyWith(fontSize: (style.fontSize ?? 0) * 0.9);
                }
                return widget.size.textStyle(context);
              }),
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return btnTheme.disabledColor.text;
                }
                if (states.contains(WidgetState.hovered)) {
                  return btnTheme.hoverColor.text;
                }
                if (states.contains(WidgetState.focused)) {
                  return btnTheme.focusColor.text;
                }
                return btnTheme.defaultColor.text;
              }),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                _disableFocusBorder();

                if (states.contains(WidgetState.focused) &&
                    states.length == 1) {
                  _enableFocusBorder();
                  return btnTheme.focusColor.background;
                }
                if (widget.isLoading) {
                  return btnTheme.loadingColor.background;
                }
                if (states.contains(WidgetState.disabled)) {
                  return btnTheme.disabledColor.background;
                }
                if (states.contains(WidgetState.hovered)) {
                  return btnTheme.hoverColor.background;
                }

                return btnTheme.defaultColor.background;
              }),
              shape: WidgetStateProperty.resolveWith((states) {
                final border = RoundedRectangleBorder(
                  borderRadius: Borders.radii.medium,
                );

                if (widget.isLoading) {
                  border.copyWith(
                      side: btnTheme.loadingColor.border != null
                          ? BorderSide(
                              color: btnTheme.loadingColor.border!,
                              width: Borders.widths.thin)
                          : null);
                }
                if (states.contains(WidgetState.disabled)) {
                  return border.copyWith(
                      side: btnTheme.disabledColor.border != null
                          ? BorderSide(
                              color: btnTheme.disabledColor.border!,
                              width: Borders.widths.thin)
                          : null);
                }
                if (states.contains(WidgetState.hovered)) {
                  return border.copyWith(
                      side: btnTheme.hoverColor.border != null
                          ? BorderSide(
                              color: btnTheme.hoverColor.border!,
                              width: Borders.widths.thin)
                          : null);
                }
                if (states.contains(WidgetState.focused)) {
                  return border.copyWith(
                      side: btnTheme.focusColor.border != null
                          ? BorderSide(
                              color: btnTheme.focusColor.border!,
                              width: Borders.widths.thin)
                          : null);
                }
                return border.copyWith(
                    side: btnTheme.defaultColor.border != null
                        ? BorderSide(
                            color: btnTheme.defaultColor.border!,
                            width: Borders.widths.thin)
                        : null);
              }),
              alignment: widget.isFullWidth ? Alignment.center : null,
            ),
            onPressed: widget.isDisabled || widget.isLoading
                ? null
                : () {
                    widget.onTap?.call();
                  },
            child: widget.isLoading
                ? loader
                : widget.isIconOnly
                    ? iconBuilder
                    : Row(
                        mainAxisSize: widget.isFullWidth
                            ? MainAxisSize.max
                            : MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: widget.isFullWidth
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          if (widget.leading != null) ...[
                            widget.leading!,
                            Spacings.spacing3.wBox,
                          ],
                          Text(widget.label ?? ''),
                          if (widget.trailing != null) ...[
                            Spacings.spacing3.wBox,
                            widget.trailing!,
                          ],
                        ],
                      ),
          ),
        ),
      ],
    );
  }
}
