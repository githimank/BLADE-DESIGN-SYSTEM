import 'package:blade_design_system/components/button_icon/icon_button.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpCustomInfoBar extends StatefulWidget {
  const BpCustomInfoBar({
    required this.status,
    super.key,
  });

  final String status;

  @override
  _BpCustomInfoBarState createState() => _BpCustomInfoBarState();
}

class _BpCustomInfoBarState extends State<BpCustomInfoBar> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.2),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _isVisible
          ? Column(
        key: ValueKey<bool>(_isVisible),
        children: [
          Container(
            padding: const EdgeInsets.all(Spacings.spacing4),
            decoration: BoxDecoration(
              color: context.colorTheme.surface.background.gray.moderate,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      widget.status,
                      style: context.appTypography.bodyMedium.medium?.copyWith(
                          color: context.colorTheme.surface.text.staticBlack.normal,
                        // fontSize: 12
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                BpIconButton(
                  size: IconButtonSize.LARGE,
                  emphasis: IconButtonEmphasis.INTENSE,
                  icon: Icon(
                    Icons.close_rounded,
                    color: context.colorTheme.surface.icon.gray.normal,
                  ),
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      )
          : const SizedBox.shrink(),
    );
  }

}
