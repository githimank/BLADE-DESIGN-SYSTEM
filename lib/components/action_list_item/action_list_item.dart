import 'package:blade_design_system/components/checkbox/bp_checkbox.dart';
import 'package:blade_design_system/components/checkbox/checkbox_enums.dart';
import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/components/inkwell_builder.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

enum ActionListItemContentType {
  ACTIONLISTITEM,
  SEPARATOR,
  SECTIONHEADING;
}

enum ActionListItemSelectionType {
  SINGLE,
  MULTIPLE;
}

class ActionListItem extends StatelessWidget {
  final ActionListItemContentType contentType;
  final ActionListItemSelectionType? selectionType;
  final bool isSelected;
  final bool isDisabled;
  final bool isDestructive;
  final String? label;
  final String? description;
  final Widget? leadingIcon;
  final Widget? trailing;
  final TextStyle? labelTextStyle;
  //TODO ADD BADGEGROUP
  final Widget? badgeGroup;
  final ValueChanged<bool>? onSelectionChanged;

  const ActionListItem(
      {super.key,
      required this.contentType,
      this.selectionType,
      this.isSelected = false,
      this.isDisabled = false,
      this.isDestructive = false,
      this.label,
      this.description,
      this.labelTextStyle,
      this.leadingIcon,
      this.trailing,
      this.badgeGroup,
      this.onSelectionChanged});

  const ActionListItem.separator({
    super.key,
  })  : contentType = ActionListItemContentType.SEPARATOR,
        selectionType = null,
        labelTextStyle = null,
        isSelected = false,
        isDisabled = false,
        isDestructive = false,
        label = null,
        description = null,
        leadingIcon = null,
        trailing = null,
        badgeGroup = null,
        onSelectionChanged = null;

  const ActionListItem.sectionHeading({
    super.key,
    required this.label,
    this.labelTextStyle,
    this.trailing,
  })  : contentType = ActionListItemContentType.SECTIONHEADING,
        selectionType = null,
        leadingIcon = null,
        isSelected = false,
        isDisabled = false,
        isDestructive = false,
        description = null,
        badgeGroup = null,
        onSelectionChanged = null;

  const ActionListItem.actionListItem({
    super.key,
    required String this.label,
    this.labelTextStyle,
    ActionListItemSelectionType this.selectionType =
        ActionListItemSelectionType.SINGLE,
    this.isSelected = false,
    this.isDisabled = false,
    this.isDestructive = false,
    this.description,
    this.leadingIcon,
    this.trailing,
    this.badgeGroup,
    this.onSelectionChanged,
  }) : contentType = ActionListItemContentType.ACTIONLISTITEM;

  @override
  Widget build(BuildContext context) {
    switch (contentType) {
      case ActionListItemContentType.ACTIONLISTITEM:
        return InkWellBuilder(
          onTap: isDisabled
              ? null
              : () {
                  // if (selectionType == ActionListItemSelectionType.SINGLE) {
                  onSelectionChanged?.call(!isSelected);
                  // }
                },
          builder: (context, states) {
            return Container(
                decoration: BoxDecoration(
                    color: WidgetStateProperty.resolveWith((states) {
                      if (isDisabled) {
                        return context
                            .colorTheme.interactive.background.gray.disabled;
                      }
                      if (isSelected) {
                        return context
                            .colorTheme.interactive.background.primary.faded;
                      }
                      if (states.contains(WidgetState.hovered) ||
                          states.contains(WidgetState.focused)) {
                        return context.colorTheme.interactive.background.gray
                            .defaultColor;
                      }
                      return context.colorTheme.transparent;
                    }).resolve(states),
                    border: states.contains(WidgetState.focused) &&
                            states.length == 1
                        ? Border.all(
                            width: 4,
                            color:
                                context.colorTheme.surface.border.primary.muted)
                        : null,
                    borderRadius: BorderRadius.circular(Spacings.spacing1)),
                padding: const EdgeInsets.all(Spacings.spacing3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      if (selectionType ==
                          ActionListItemSelectionType.MULTIPLE) ...[
                        BpCheckbox(
                          size: CheckboxSize.MEDIUM,
                          isChecked: isSelected,
                          isDisabled: isDisabled,
                          onChanged: (value) =>
                              onSelectionChanged?.call(value ?? false),
                        ),
                        Spacings.spacing3.wBox,
                      ],
                      if (leadingIcon != null) ...[
                        leadingIcon!,
                        Spacings.spacing3.wBox,
                      ],
                      Expanded(
                        child: Text(
                          label!,
                          style: labelTextStyle ??
                              context.appTypography.bodyMedium.setColor(
                                  isDisabled
                                      ? context.colorTheme.interactive.text.gray
                                          .disabled
                                      : isDestructive
                                          ? context.colorTheme.interactive.text
                                              .negative.normal
                                          : context.colorTheme.interactive.text
                                              .gray.normal),
                        ),
                      ),
                      if (trailing != null) ...[
                        Spacings.spacing3.wBox,
                        trailing!,
                      ],
                    ]),
                    if (description != null) Spacings.spacing1.hBox,
                    if (description != null)
                      IgnorePointer(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (selectionType ==
                                  ActionListItemSelectionType.MULTIPLE) ...[
                                Opacity(
                                  opacity: 0,
                                  child: BpCheckbox(
                                    size: CheckboxSize.MEDIUM,
                                    isChecked: isSelected,
                                    isDisabled: isDisabled,
                                    onChanged: (value) => onSelectionChanged
                                        ?.call(value ?? false),
                                  ),
                                ),
                                Spacings.spacing3.wBox,
                              ],
                              if (leadingIcon != null) ...[
                                Opacity(opacity: 0, child: leadingIcon!),
                                Spacings.spacing3.wBox,
                              ],
                              Expanded(
                                child: Text(
                                  description!,
                                  style: context.appTypography.bodySmall
                                      .setColor(isDisabled
                                          ? context.colorTheme.interactive.text
                                              .gray.disabled
                                          : context.colorTheme.interactive.text
                                              .gray.muted),
                                ),
                              ),
                              if (trailing != null) ...[
                                Spacings.spacing3.wBox,
                                Opacity(opacity: 0, child: trailing!),
                              ],
                            ]),
                      ),
                  ],
                ));
          },
        );
      case ActionListItemContentType.SEPARATOR:
        return const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Spacings.spacing3, vertical: Spacings.spacing1),
          child: BpDivider(
            variant: DividerVariant.MUTED,
            thickness: DividerThickness.THIN,
          ),
        );
      case ActionListItemContentType.SECTIONHEADING:
        return Container(
            padding: const EdgeInsets.fromLTRB(
                Spacings.spacing3, 9, Spacings.spacing3, 3),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      label!,
                      style: context.appTypography.bodySmall.semiBold.setColor(
                          context.colorTheme.interactive.text.gray.muted),
                    ),
                  ),
                  if (trailing != null) ...[
                    Spacings.spacing3.wBox,
                    trailing!,
                  ],
                ]));
    }
  }
}
