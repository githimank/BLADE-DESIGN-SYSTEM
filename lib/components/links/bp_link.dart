import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'link_styles.dart';

class BpLink extends StatefulWidget {
  final LinkType type;
  final ButtonMood mood;
  final LinkSize size;
  final bool isIconOnly;
  final bool isDisabled;
  final String? label;
  final Widget? icon;
  final VoidCallback? onTap;
  final LinkIconPosition? linkIconPosition;
  final bool underlineLabel;

  const BpLink({
    this.size = LinkSize.MEDIUM,
    this.label,
    this.mood = ButtonMood.PRIMARY,
    this.type = LinkType.ANCHOR,
    this.isIconOnly = false,
    this.isDisabled = false,
    this.onTap,
    this.icon,
    this.linkIconPosition = LinkIconPosition.RIGHT,
    this.underlineLabel = false,
    super.key,
  });

  @override
  State<BpLink> createState() => _BpLinkState();
}

class _BpLinkState extends State<BpLink> {
  final Set<WidgetState> states = {};

  @override
  void initState() {
    super.initState();
    if (widget.isDisabled) {
      states.add(WidgetState.disabled);
    }
  }

  @override
  void didUpdateWidget(covariant BpLink oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDisabled != oldWidget.isDisabled) {
      if (widget.isDisabled) {
        states.add(WidgetState.disabled);
      } else {
        states.remove(WidgetState.disabled);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final LinkProperties buttonLinkProperties = switch (widget.type) {
      LinkType.ANCHOR => LinkProperties.anchor(context),
      LinkType.ACTION => LinkProperties.action(context),
    };

    final LinkStateColors btnLinkTheme =
        buttonLinkProperties.stateColors(widget.mood);

    Color getColor() {
      if (states.contains(WidgetState.disabled)) {
        return btnLinkTheme.disabledColor.text;
      } else if (states.contains(WidgetState.focused)) {
        return btnLinkTheme.focusColor.text;
      } else if (states.contains(WidgetState.hovered)) {
        return btnLinkTheme.hoverColor.text;
      }
      return btnLinkTheme.defaultColor.text;
    }

    TextDecoration getTextDecoration() {
      if (widget.type == LinkType.ANCHOR &&
          (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused))) {
        return TextDecoration.underline;
      }
      return TextDecoration.none;
    }

    final TextDecoration textDecoration = widget.isDisabled
        ? TextDecoration.none
        : (widget.underlineLabel
            ? TextDecoration.underline
            : getTextDecoration());

    return InkWell(
      hoverColor: context.colorTheme.transparent,
      splashColor: context.colorTheme.transparent,
      focusColor: context.colorTheme.transparent,
      highlightColor: context.colorTheme.transparent,
      onTap: widget.isDisabled
          ? null
          : () {
              widget.onTap?.call();
              states.remove(WidgetState.hovered);
              setState(() {});
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
      child: Container(
        decoration: states.contains(WidgetState.focused)
            ? BoxDecoration(
                border: Border.all(
                  color: btnLinkTheme.focusColor.focusBorder!,
                  width: Borders.widths.thicker,
                ),
                borderRadius: Borders.radii.medium,
              )
            : null,
        child: widget.isIconOnly
            ? (widget.icon != null
                ? SizedBox(
                    width: widget.size.height,
                    height: widget.size.height,
                    child: FittedBox(
                      child: widget.icon!,
                    ),
                  )
                : const SizedBox.shrink())
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.linkIconPosition == LinkIconPosition.LEFT) ...[
                    if (widget.icon != null) ...[
                      SizedBox(
                        width: widget.size.height,
                        height: widget.size.height,
                        child: FittedBox(
                          child: widget.icon!,
                        ),
                      ),
                      Spacings.spacing2.wBox,
                    ],
                  ],
                  if (widget.label?.isNotEmpty ?? false)
                    Text(
                      widget.label!,
                      style: widget.type == LinkType.ACTION
                          ? widget.size.textStyleWithSemiBold(context).copyWith(
                                color: getColor(),
                                decoration: textDecoration,
                                decorationColor:
                                    textDecoration == TextDecoration.none
                                        ? context.colorTheme.transparent
                                        : getColor(),
                              )
                          : widget.size.textStyleWithMedium(context).copyWith(
                                color: getColor(),
                                decoration: textDecoration,
                                decorationColor:
                                    textDecoration == TextDecoration.none
                                        ? context.colorTheme.transparent
                                        : getColor(),
                              ),
                    ),
                  if (widget.linkIconPosition == LinkIconPosition.RIGHT) ...[
                    Spacings.spacing2.wBox,
                    if (widget.icon != null) ...[
                      SizedBox(
                        width: widget.size.height,
                        height: widget.size.height,
                        child: FittedBox(
                          child: widget.icon!,
                        ),
                      ),
                      Spacings.spacing2.wBox,
                    ],
                  ]
                ],
              ),
      ),
    );
  }
}
