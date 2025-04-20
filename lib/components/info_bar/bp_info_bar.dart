import 'package:blade_design_system/components/button_icon/icon_button.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BpInfoBar {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, {required String status}) {
    _hide();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + kToolbarHeight,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(Spacings.spacing4),
            decoration: BoxDecoration(
                color: context.colorTheme.surface.background.gray.moderate),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      status,
                      style: context.appTypography.bodySmall.regular?.copyWith(
                          color: context
                              .colorTheme.surface.text.staticBlack.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                BpIconButton(
                  size: IconButtonSize.LARGE,
                  emphasis: IconButtonEmphasis.INTENSE,
                  icon: Icon(Icons.close_rounded,
                      color: context.colorTheme.surface.icon.gray.normal),
                  onTap: _hide,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void _hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
