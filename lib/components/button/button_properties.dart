import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';


enum ButtonVariant {
  PRIMARY,
  SECONDARY,
  TERTIARY;
}

enum ButtonMood {
  PRIMARY,
  WHITE,
  NEGATIVE,
  POSITIVE,
  NOTICE,
  INFORMATION,
  NEUTRAL;
}

enum ButtonSize {
  LARGE(48.0, loaderHeight: 20),
  MEDIUM(36.0, loaderHeight: 20),
  SMALL(32.0, loaderHeight: 16),
  EXTRA_SMALL(28.0, loaderHeight: 16);

  final double height;
  final double loaderHeight;

  const ButtonSize(this.height, {
    required this.loaderHeight,
  });

  TextStyle textStyle(BuildContext context) =>
      switch (this) {
        ButtonSize.LARGE => context.appTypography.bodyLarge.semiBold!,
        ButtonSize.MEDIUM => context.appTypography.bodyMedium.semiBold!,
        ButtonSize.SMALL => context.appTypography.bodySmall.semiBold!,
        ButtonSize.EXTRA_SMALL => context.appTypography.bodySmall.semiBold!,
      };

  double get horizontalPadding =>
      switch (this) {
        ButtonSize.LARGE => Spacings.spacing7,
        ButtonSize.MEDIUM => Spacings.spacing6,
        ButtonSize.SMALL => Spacings.spacing4,
        ButtonSize.EXTRA_SMALL => Spacings.spacing4,
      };

  double get horizontalIconPadding =>
      switch (this) {
        ButtonSize.LARGE => Spacings.spacing5,
        ButtonSize.MEDIUM => 10,
        ButtonSize.SMALL => Spacings.spacing3,
        ButtonSize.EXTRA_SMALL => 6,
      };
}


class ButtonProperties {
  final ButtonStateColors primary;
  final ButtonStateColors white;
  final ButtonStateColors negative;
  final ButtonStateColors positive;
  final ButtonStateColors notice;
  final ButtonStateColors information;
  final ButtonStateColors neutral;

  ButtonProperties({required this.primary,
    required this.white,
    required this.negative,
    required this.positive,
    required this.notice,
    required this.information,
    required this.neutral});

  ButtonStateColors stateColors(ButtonMood mood) {
    return switch(mood){
      ButtonMood.PRIMARY => primary,
      ButtonMood.WHITE => white,
      ButtonMood.NEGATIVE => negative,
      ButtonMood.POSITIVE => positive,
      ButtonMood.NOTICE => notice,
      ButtonMood.INFORMATION => information,
      ButtonMood.NEUTRAL => neutral
    };
  }

  static ButtonProperties base(BuildContext context) =>
      ButtonProperties(
        primary: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.primary.defaultColor,
                text: context.colorTheme.interactive.text.onPrimary.normal,
                icon: context.colorTheme.interactive.icon.onPrimary.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.primary.highlighted,
                text: context.colorTheme.interactive.text.onPrimary.normal,
                icon: context.colorTheme.interactive.icon.onPrimary.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.primary.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.onPrimary.normal,
                icon: context.colorTheme.interactive.icon.onPrimary.normal),
            disabledColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.primary.disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled),
            loadingColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.primary.disabled,
                loaderTrackColor: context.colorTheme.surface.background.primary
                    .subtle,
                loaderArcColor: context.colorTheme.surface.background.primary
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        white: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.defaultColor,
                text: context.colorTheme.interactive.text.staticBlack.muted,
                icon: context.colorTheme.interactive.icon.staticBlack.muted),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.highlighted,
                text: context.colorTheme.interactive.text.staticBlack.muted,
                icon: context.colorTheme.interactive.icon.staticBlack.muted),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticBlack.muted,
                icon: context.colorTheme.interactive.icon.staticBlack.muted),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.disabled,
                text: context.colorTheme.interactive.text.staticBlack.disabled,
                icon: context.colorTheme.interactive.icon.staticBlack.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.disabled,
                loaderTrackColor: context.colorTheme.feedback.background.neutral
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.neutral
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        negative: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.defaultColor,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.negative.disabled,
                text: context.colorTheme.interactive.text.negative.disabled,
                icon: context.colorTheme.interactive.icon.negative.disabled),
            loadingColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.negative.disabled,
                loaderTrackColor: context.colorTheme.feedback.background
                    .negative.subtle,
                loaderArcColor: context.colorTheme.feedback.background.negative
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        positive: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.defaultColor,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.positive.disabled,
                text: context.colorTheme.interactive.text.positive.disabled,
                icon: context.colorTheme.interactive.icon.positive.disabled),
            loadingColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.positive.disabled,
                loaderTrackColor: context.colorTheme.feedback.background
                    .positive.subtle,
                loaderArcColor: context.colorTheme.feedback.background.positive
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        notice: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.defaultColor,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.notice.disabled,
                text: context.colorTheme.interactive.text.notice.disabled,
                icon: context.colorTheme.interactive.icon.notice.disabled),
            loadingColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.notice.disabled,
                loaderTrackColor: context.colorTheme.feedback.background.notice
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.notice
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        information: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.defaultColor,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.disabled,
                text: context.colorTheme.interactive.text.information.disabled,
                icon: context.colorTheme.interactive.icon.information.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.disabled,
                loaderTrackColor: context.colorTheme.feedback.background
                    .information.subtle,
                loaderArcColor: context.colorTheme.feedback.background
                    .information.intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        neutral: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.defaultColor,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.neutral.disabled,
                text: context.colorTheme.interactive.text.neutral.disabled,
                icon: context.colorTheme.interactive.icon.neutral.disabled),
            loadingColor: ButtonPropertyColors(
                background:
                context.colorTheme.interactive.background.neutral.disabled,
                loaderTrackColor: context.colorTheme.feedback.background.neutral
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.neutral
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
      );

  static ButtonProperties secondary(BuildContext context) =>
      ButtonProperties(
        primary: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.transparent,
                border: context.colorTheme.interactive.border.primary
                    .defaultColor,

                text: context.colorTheme.interactive.text.primary.normal,
                icon: context.colorTheme.interactive.icon.primary.subtle),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.primary.faded,
                border: context.colorTheme.interactive.border.primary
                    .defaultColor,
                text: context.colorTheme.interactive.text.primary.normal,
                icon: context.colorTheme.interactive.icon.primary.subtle),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.primary.faded,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.primary
                    .defaultColor,
                text: context.colorTheme.interactive.text.primary.normal,
                icon: context.colorTheme.interactive.icon.primary.subtle),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.transparent,
                border: context.colorTheme.interactive.border.primary.disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.transparent,
                border: context.colorTheme.interactive.border.primary.disabled,
                loaderTrackColor: context.colorTheme.surface.background.primary
                    .subtle,
                loaderArcColor: context.colorTheme.surface.background.primary
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        white: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.transparent,
                border: context.colorTheme.interactive.border.staticWhite
                    .highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.faded,
                border: context.colorTheme.interactive.border.staticWhite
                    .highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.faded,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.staticWhite
                    .highlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.transparent,
                border: context.colorTheme.interactive.border.staticWhite
                    .disabled,
                text: context.colorTheme.interactive.text.staticWhite.disabled,
                icon: context.colorTheme.interactive.icon.staticWhite.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.transparent,
                border: context.colorTheme.interactive.border.staticWhite
                    .disabled,
                loaderTrackColor: context.colorTheme.feedback.background.neutral
                    .subtle,
                loaderArcColor: context.colorTheme.surface.background.gray
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        negative: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.faded,
                border: context.colorTheme.interactive.border.negative
                    .defaultColor,
                text: context.colorTheme.interactive.text.negative.normal,
                icon: context.colorTheme.interactive.icon.negative.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative
                    .fadedHighlighted,
                border: context.colorTheme.interactive.border.negative
                    .defaultColor,
                text: context.colorTheme.interactive.text.negative.normal,
                icon: context.colorTheme.interactive.icon.negative.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.negative
                    .defaultColor,
                text: context.colorTheme.interactive.text.negative.normal,
                icon: context.colorTheme.interactive.icon.negative.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.disabled,
                border: context.colorTheme.interactive.border.negative.disabled,
                text: context.colorTheme.interactive.text.negative.disabled,
                icon: context.colorTheme.interactive.icon.negative.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.disabled,
                border: context.colorTheme.interactive.border.negative.disabled,
                loaderTrackColor: context.colorTheme.feedback.background
                    .negative
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.negative
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        positive: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.faded,
                border: context.colorTheme.interactive.border.positive
                    .defaultColor,
                text: context.colorTheme.interactive.text.positive.normal,
                icon: context.colorTheme.interactive.icon.positive.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive
                    .fadedHighlighted,
                border: context.colorTheme.interactive.border.positive
                    .defaultColor,
                text: context.colorTheme.interactive.text.positive.normal,
                icon: context.colorTheme.interactive.icon.positive.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.positive
                    .defaultColor,
                text: context.colorTheme.interactive.text.positive.normal,
                icon: context.colorTheme.interactive.icon.positive.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.disabled,
                border: context.colorTheme.interactive.border.positive.disabled,
                text: context.colorTheme.interactive.text.positive.disabled,
                icon: context.colorTheme.interactive.icon.positive.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.disabled,
                border: context.colorTheme.interactive.border.positive.disabled,
                loaderTrackColor: context.colorTheme.feedback.background
                    .positive
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.positive
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        notice: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.faded,
                border: context.colorTheme.interactive.border.notice
                    .defaultColor,
                text: context.colorTheme.interactive.text.notice.normal,
                icon: context.colorTheme.interactive.icon.notice.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.fadedHighlighted,
                border: context.colorTheme.interactive.border.notice
                    .defaultColor,
                text: context.colorTheme.interactive.text.notice.normal,
                icon: context.colorTheme.interactive.icon.notice.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.notice
                    .defaultColor,
                text: context.colorTheme.interactive.text.notice.normal,
                icon: context.colorTheme.interactive.icon.notice.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.disabled,
                border: context.colorTheme.interactive.border.notice.disabled,
                text: context.colorTheme.interactive.text.notice.disabled,
                icon: context.colorTheme.interactive.icon.notice.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.disabled,
                border: context.colorTheme.interactive.border.notice.disabled,
                loaderTrackColor: context.colorTheme.interactive.text.notice
                    .disabled,
                loaderArcColor: context.colorTheme.feedback.background.notice
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        information: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.faded,
                border: context.colorTheme.interactive.border.information
                    .defaultColor,
                text: context.colorTheme.interactive.text.information.normal,
                icon: context.colorTheme.interactive.icon.information.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information
                    .fadedHighlighted,
                border: context.colorTheme.interactive.border.information
                    .defaultColor,
                text: context.colorTheme.interactive.text.information.normal,
                icon: context.colorTheme.interactive.icon.information.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.information
                    .defaultColor,
                text: context.colorTheme.interactive.text.information.normal,
                icon: context.colorTheme.interactive.icon.information.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.disabled,
                border: context.colorTheme.interactive.border.information
                    .disabled,
                text: context.colorTheme.interactive.text.information.disabled,
                icon: context.colorTheme.interactive.icon.information.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.disabled,
                border: context.colorTheme.interactive.border.information
                    .disabled,
                loaderTrackColor: context.colorTheme.feedback.background
                    .information
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background
                    .information
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        neutral: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.faded,
                border: context.colorTheme.interactive.border.neutral
                    .defaultColor,
                text: context.colorTheme.interactive.text.neutral.normal,
                icon: context.colorTheme.interactive.icon.neutral.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.fadedHighlighted,
                border: context.colorTheme.interactive.border.neutral
                    .defaultColor,
                text: context.colorTheme.interactive.text.neutral.normal,
                icon: context.colorTheme.interactive.icon.neutral.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.neutral
                    .defaultColor,
                text: context.colorTheme.interactive.text.neutral.normal,
                icon: context.colorTheme.interactive.icon.neutral.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.disabled,
                border: context.colorTheme.interactive.border.neutral.disabled,
                text: context.colorTheme.interactive.text.neutral.disabled,
                icon: context.colorTheme.interactive.icon.neutral.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.disabled,
                border: context.colorTheme.interactive.border.neutral.disabled,
                loaderTrackColor: context.colorTheme.feedback.background.neutral
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.neutral
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
      );

  static ButtonProperties tertiary(BuildContext context) =>
      ButtonProperties(
        primary: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.gray.defaultColor,
                text: context.colorTheme.interactive.text.gray.normal,
                icon: context.colorTheme.interactive.icon.gray.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.gray.highlighted,
                text: context.colorTheme.interactive.text.gray.normal,
                icon: context.colorTheme.interactive.icon.gray.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.gray.highlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.gray.normal,
                icon: context.colorTheme.interactive.icon.gray.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.gray.disabled,
                text: context.colorTheme.interactive.text.gray.disabled,
                icon: context.colorTheme.interactive.icon.gray.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.gray.disabled,
                loaderTrackColor: context.colorTheme.feedback.background.neutral
                    .subtle,
                loaderArcColor: context.colorTheme.feedback.background.neutral
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        white: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.faded,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite
                    .fadedHighlighted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                text: context.colorTheme.interactive.text.staticWhite.normal,
                icon: context.colorTheme.interactive.icon.staticWhite.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.disabled,
                text: context.colorTheme.interactive.text.staticWhite.disabled,
                icon: context.colorTheme.interactive.icon.staticWhite.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.staticWhite.disabled,
                loaderTrackColor: context.colorTheme.feedback.background.neutral
                    .subtle,
                loaderArcColor: context.colorTheme.surface.background.gray
                    .intense,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        //TODO:- not available for use
        negative: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.faded,
                border: context.colorTheme.interactive.border.negative
                    .defaultColor,
                text: context.colorTheme.interactive.text.negative.normal,
                icon: context.colorTheme.interactive.icon.negative.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative
                    .fadedHighlighted,
                border: context.colorTheme.interactive.border.negative
                    .defaultColor,
                text: context.colorTheme.interactive.text.negative.normal,
                icon: context.colorTheme.interactive.icon.negative.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.negative
                    .defaultColor,
                text: context.colorTheme.interactive.text.negative.normal,
                icon: context.colorTheme.interactive.icon.negative.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.disabled,
                border: context.colorTheme.interactive.border.negative.disabled,
                text: context.colorTheme.interactive.text.negative.disabled,
                icon: context.colorTheme.interactive.icon.negative.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.negative.disabled,
                border: context.colorTheme.interactive.border.negative.disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        positive: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.faded,
                border: context.colorTheme.interactive.border.positive
                    .defaultColor,
                text: context.colorTheme.interactive.text.positive.normal,
                icon: context.colorTheme.interactive.icon.positive.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive
                    .fadedHighlighted,
                border: context.colorTheme.interactive.border.positive
                    .defaultColor,
                text: context.colorTheme.interactive.text.positive.normal,
                icon: context.colorTheme.interactive.icon.positive.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.positive
                    .defaultColor,
                text: context.colorTheme.interactive.text.positive.normal,
                icon: context.colorTheme.interactive.icon.positive.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.disabled,
                border: context.colorTheme.interactive.border.positive.disabled,
                text: context.colorTheme.interactive.text.positive.disabled,
                icon: context.colorTheme.interactive.icon.positive.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.positive.disabled,
                border: context.colorTheme.interactive.border.positive.disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        notice: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.faded,
                border: context.colorTheme.interactive.border.notice
                    .defaultColor,
                text: context.colorTheme.interactive.text.notice.normal,
                icon: context.colorTheme.interactive.icon.notice.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.fadedHighlighted,
                border: context.colorTheme.interactive.border.notice
                    .defaultColor,
                text: context.colorTheme.interactive.text.notice.normal,
                icon: context.colorTheme.interactive.icon.notice.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.notice
                    .defaultColor,
                text: context.colorTheme.interactive.text.notice.normal,
                icon: context.colorTheme.interactive.icon.notice.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.disabled,
                border: context.colorTheme.interactive.border.notice.disabled,
                text: context.colorTheme.interactive.text.notice.disabled,
                icon: context.colorTheme.interactive.icon.notice.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.notice.disabled,
                border: context.colorTheme.interactive.border.notice.disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        information: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.faded,
                border: context.colorTheme.interactive.border.information
                    .defaultColor,
                text: context.colorTheme.interactive.text.information.normal,
                icon: context.colorTheme.interactive.icon.information.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information
                    .fadedHighlighted,
                border: context.colorTheme.interactive.border.information
                    .defaultColor,
                text: context.colorTheme.interactive.text.information.normal,
                icon: context.colorTheme.interactive.icon.information.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information
                    .fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.information
                    .defaultColor,
                text: context.colorTheme.interactive.text.information.normal,
                icon: context.colorTheme.interactive.icon.information.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.disabled,
                border: context.colorTheme.interactive.border.information
                    .disabled,
                text: context.colorTheme.interactive.text.information.disabled,
                icon: context.colorTheme.interactive.icon.information.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.information.disabled,
                border: context.colorTheme.interactive.border.information
                    .disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
        neutral: ButtonStateColors(
            defaultColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.faded,
                border: context.colorTheme.interactive.border.neutral
                    .defaultColor,
                text: context.colorTheme.interactive.text.neutral.normal,
                icon: context.colorTheme.interactive.icon.neutral.normal),
            hoverColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.fadedHighlighted,
                border: context.colorTheme.interactive.border.neutral
                    .defaultColor,
                text: context.colorTheme.interactive.text.neutral.normal,
                icon: context.colorTheme.interactive.icon.neutral.normal),
            focusColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.fadedHighlighted,
                focusBorder: context.colorTheme.surface.border.primary.muted,
                border: context.colorTheme.interactive.border.neutral
                    .defaultColor,
                text: context.colorTheme.interactive.text.neutral.normal,
                icon: context.colorTheme.interactive.icon.neutral.normal),
            disabledColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.disabled,
                border: context.colorTheme.interactive.border.neutral.disabled,
                text: context.colorTheme.interactive.text.neutral.disabled,
                icon: context.colorTheme.interactive.icon.neutral.disabled),
            loadingColor: ButtonPropertyColors(
                background: context
                    .colorTheme.interactive.background.neutral.disabled,
                border: context.colorTheme.interactive.border.neutral.disabled,
                text: context.colorTheme.interactive.text.primary.disabled,
                icon: context.colorTheme.interactive.icon.primary.disabled)),
      );
}

class ButtonPropertyColors {
  final Color background;
  final Color? focusBorder;
  final Color? border;
  final Color? loaderArcColor;
  final Color? loaderTrackColor;
  final Color text;
  final Color icon;

  const ButtonPropertyColors({required this.background,
    this.focusBorder,
    this.border,
    this.loaderArcColor,
    this.loaderTrackColor,
    required this.text,
    required this.icon});
}

class ButtonStateColors {
  final ButtonPropertyColors defaultColor;
  final ButtonPropertyColors hoverColor;
  final ButtonPropertyColors focusColor;
  final ButtonPropertyColors disabledColor;
  final ButtonPropertyColors loadingColor;

  const ButtonStateColors({required this.defaultColor,
    required this.hoverColor,
    required this.focusColor,
    required this.disabledColor,
    required this.loadingColor});
}
