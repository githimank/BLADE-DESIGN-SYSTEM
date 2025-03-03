import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/easings.dart';
import 'package:blade_design_system/theme/tokens/global_icon_size.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'accordion_enum.dart';

class AccordionHeaderData {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? titleWidget;
  final Widget? trailing;
  final Widget? titleSuffix;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool showNumberPrefix;
  final int? index;
  final bool isExpanded;
  final AccordionSize size;

  const AccordionHeaderData(
      {required this.title,
      required this.subtitle,
      required this.leading,
      required this.titleWidget,
      required this.trailing,
      required this.titleSuffix,
      required this.onTap,
      required this.isDisabled,
      required this.showNumberPrefix,
      required this.index,
      required this.isExpanded,
      required this.size});
}

class BpAccordionHeader extends StatefulWidget {
  final AccordionHeaderData headerData;

  const BpAccordionHeader({super.key, required this.headerData});

  @override
  State<BpAccordionHeader> createState() => _BpAccordionHeaderState();
}

class _BpAccordionHeaderState extends State<BpAccordionHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Set<WidgetState> _states = {};

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: -0.5).animate(
      CurvedAnimation(parent: _controller, curve: Easings.standardRevealing),
    );
    if (widget.headerData.isExpanded) {
      _controller.forward();
    }
    if (widget.headerData.isDisabled) {
      _states.add(WidgetState.disabled);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BpAccordionHeader oldWidget) {
    if (widget.headerData.isDisabled != oldWidget.headerData.isDisabled) {
      if (widget.headerData.isDisabled) {
        _states.add(WidgetState.disabled);
      } else {
        _states.remove(WidgetState.disabled);
      }
    }

    if (widget.headerData.isDisabled == false) {
      if (widget.headerData.isExpanded != oldWidget.headerData.isExpanded) {
        final isExpanded = widget.headerData.isExpanded;
        if (isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = getValueWithStates(_states,
        defaultStateValue: !widget.headerData.isExpanded
            ? context.colorTheme.transparent
            : context.colorTheme.interactive.background.gray.defaultColor,
        hoverStateValue: context.colorTheme.interactive.background.gray.faded,
        focusStateValue: context.colorTheme.interactive.background.gray.faded,
        disabledStateValue:
            context.colorTheme.interactive.background.gray.disabled);

    final iconColor = getValueWithStates(_states,
        defaultStateValue: context.colorTheme.interactive.icon.gray.muted,
        hoverStateValue: context.colorTheme.interactive.icon.gray.subtle,
        focusStateValue: context.colorTheme.interactive.icon.gray.subtle,
        disabledStateValue: context.colorTheme.interactive.icon.gray.disabled);

    final titleTextStyle = switch (widget.headerData.size) {
      AccordionSize.MEDIUM => context.appTypography.headingMedium.semiBold,
      AccordionSize.LARGE => context.appTypography.headingLarge.semiBold,
    };

    return InkWell(
      hoverColor: context.colorTheme.transparent,
      splashColor: context.colorTheme.transparent,
      focusColor: context.colorTheme.transparent,
      highlightColor: context.colorTheme.transparent,
      onFocusChange: (isFocused) {
        if (isFocused) {
          _states.add(WidgetState.focused);
        } else {
          _states.remove(WidgetState.focused);
        }
        setState(() {});
      },
      onHover: (isHovered) {
        if (isHovered) {
          _states.add(WidgetState.hovered);
        } else {
          _states.remove(WidgetState.hovered);
        }
        setState(() {});
      },
      onTap: widget.headerData.isDisabled
          ? null
          : () {
              widget.headerData.onTap?.call();
            },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: Spacings.spacing5, horizontal: Spacings.spacing5),
        decoration: BoxDecoration(
          color: bgColor,
          border: _states.contains(WidgetState.focused)
              ? Border.all(
                  color: context.colorTheme.surface.border.primary.muted,
                  width: 3)
              : null,
          borderRadius: _states.contains(WidgetState.focused)
              ? Borders.radii.medium
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.headerData.showNumberPrefix &&
                widget.headerData.index != null)
              Text(
                '${widget.headerData.index! + 1}.',
                style: (widget.headerData.size == AccordionSize.MEDIUM
                        ? context.appTypography.bodyMedium.regular.semiBold
                        : context.appTypography.bodyLarge.regular.semiBold)
                    .setColor(widget.headerData.isDisabled
                        ? context.colorTheme.surface.text.gray.disabled
                        : context.colorTheme.surface.text.gray.normal),
              )
            else if (widget.headerData.leading != null)
              widget.headerData.leading!,
            if (widget.headerData.leading != null ||
                widget.headerData.showNumberPrefix)
              Spacings.spacing2.wBox,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.headerData.titleWidget != null)
                        widget.headerData.titleWidget!
                      else
                        Text(widget.headerData.title ?? '',
                            style: titleTextStyle?.setColor(widget
                                    .headerData.isDisabled
                                ? context.colorTheme.surface.text.gray.disabled
                                : context.colorTheme.surface.text.gray.normal)),
                      if (widget.headerData.titleSuffix != null)
                        widget.headerData.titleSuffix!,
                    ],
                  ),
                  if (widget.headerData.subtitle != null)
                    Text(
                      widget.headerData.subtitle!,
                      style: context.appTypography.bodySmall.regular.setColor(
                          widget.headerData.isDisabled
                              ? context.colorTheme.surface.text.gray.disabled
                              : context.colorTheme.surface.text.gray.muted),
                    ),
                ],
              ),
            ),
            if (widget.headerData.trailing != null) widget.headerData.trailing!,
            Spacings.spacing4.wBox,
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value * 2 * 3.141592653589793,
                    child: Icon(
                      Icons.expand_more,
                      size: GlobalIconSize.large,
                      color: iconColor,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
