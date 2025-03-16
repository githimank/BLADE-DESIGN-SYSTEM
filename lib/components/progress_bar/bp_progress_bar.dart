import 'package:blade_design_system/theme/colors/color_mood.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/motion_durations.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

enum ProgressBarIntent {
  NONE,
  POSITIVE,
  NEGATIVE,
  NOTICE,
  INFORMATION,
  NEUTRAL;

  ColorMood colorMood(BuildContext context) => switch (this) {
        ProgressBarIntent.NONE => context.colorTheme.surface.background.primary,
        ProgressBarIntent.POSITIVE =>
          context.colorTheme.feedback.background.positive,
        ProgressBarIntent.NEGATIVE =>
          context.colorTheme.feedback.background.negative,
        ProgressBarIntent.NOTICE =>
          context.colorTheme.feedback.background.notice,
        ProgressBarIntent.INFORMATION =>
          context.colorTheme.feedback.background.information,
        ProgressBarIntent.NEUTRAL =>
          context.colorTheme.feedback.background.neutral,
      };
}

enum ProgressBarSize {
  SMALL,
  LARGE;

  double get horizontalGap => switch (this) {
        ProgressBarSize.SMALL => Spacings.spacing2,
        ProgressBarSize.LARGE => Spacings.spacing2,
      };
  double get verticalGap => switch (this) {
        ProgressBarSize.SMALL => Spacings.spacing2,
        ProgressBarSize.LARGE => Spacings.spacing2,
      };

  double get progressBarHeight => switch (this) {
        ProgressBarSize.SMALL => Spacings.spacing1,
        ProgressBarSize.LARGE => Spacings.spacing2,
      };
}

class BpProgressBar extends StatefulWidget {
  final String? label;
  final String? accessibilityLabel;
  final ProgressBarSize size;
  final ProgressBarIntent intent;
  final bool isIndeterminate;
  final bool showPercentage;
  final double value;

  const BpProgressBar(
      {super.key,
      this.label,
      this.accessibilityLabel,
      this.size = ProgressBarSize.LARGE,
      this.intent = ProgressBarIntent.NONE,
      this.isIndeterminate = false,
      this.showPercentage = true,
      this.value = 0})
      : assert(value >= 0 && value <= 1, 'Value must be between 0 and 1');

  @override
  State<BpProgressBar> createState() => _BpProgressBarState();
}

class _BpProgressBarState extends State<BpProgressBar> {
  ValueNotifier<double> _valueNotifier = ValueNotifier<double>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null ||
            (!widget.isIndeterminate && widget.showPercentage))
          Padding(
            padding: EdgeInsets.only(bottom: widget.size.verticalGap),
            child: Row(
              children: [
                if (widget.label != null)
                  Expanded(
                    child: Text(
                      widget.label!,
                      style: context.appTypography.bodySmall.regular.setColor(
                          context.colorTheme.surface.text.gray.subtle),
                    ),
                  )
                else
                  const Spacer(),
                if (!widget.isIndeterminate && widget.showPercentage)
                  Padding(
                    padding: EdgeInsets.only(left: widget.size.horizontalGap),
                    child: ValueListenableBuilder(
                        valueListenable: _valueNotifier,
                        builder: (context, value, child) {
                          return Text(
                            '${(value * 100).toStringAsFixed(0)}%',
                            style: context.appTypography.bodySmall.regular
                                .setColor(context
                                    .colorTheme.surface.text.gray.subtle),
                          );
                        }),
                  )
              ],
            ),
          ),
        !widget.isIndeterminate
            ? _CustomLinearProgressIndicator(
                value: widget.isIndeterminate ? null : widget.value,
                height: widget.size.progressBarHeight,
                backgroundColor:
                    context.colorTheme.feedback.background.neutral.subtle,
                progressColor: widget.intent.colorMood(context).intense,
                animationDuration: MotionDurations.gentle2X,
                onValueChanged: (value) {
                  _valueNotifier.value = value;
                },
                semanticsLabel: widget.accessibilityLabel,
                semanticsValue: widget.value.toString(),
              )
            : SizedBox(
                height: widget.size.progressBarHeight,
                child: LinearProgressIndicator(
                  backgroundColor:
                      context.colorTheme.feedback.background.neutral.subtle,
                  color: widget.intent.colorMood(context).intense,
                  semanticsLabel: widget.accessibilityLabel,
                  semanticsValue: widget.value.toString(),
                ),
              ),
      ],
    );
  }
}

class _CustomLinearProgressIndicator extends StatefulWidget {
  final double? value;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animationDuration;
  final String? semanticsLabel;
  final String? semanticsValue;
  final ValueChanged<double>? onValueChanged;

  const _CustomLinearProgressIndicator({
    super.key,
    this.value,
    this.height = 4.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.animationDuration = const Duration(milliseconds: 500),
    this.semanticsLabel,
    this.semanticsValue,
    this.onValueChanged,
  });

  @override
  State<_CustomLinearProgressIndicator> createState() =>
      _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState
    extends State<_CustomLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() {
        Future.delayed(
            Duration(
                milliseconds: widget.animationDuration.inMilliseconds ~/
                    (_controller.value * 20)), () {
          widget.onValueChanged?.call(_controller.value);
        });
      });

    if (widget.value != null) {
      _controller.value = widget.value!;
    }
  }

  @override
  void didUpdateWidget(covariant _CustomLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != null) {
      _controller.animateTo(widget.value!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      value: widget.semanticsValue,
      child: SizedBox(
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.height / 2),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double progress = widget.value ?? 0.0;

              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: widget.height,
                    color: widget.backgroundColor,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: widget.animationDuration,
                      width: MediaQuery.of(context).size.width * progress,
                      height: widget.height,
                      color: widget.progressColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
