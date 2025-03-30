import 'package:blade_design_system/components/badges/bp_badges.dart';
import 'package:blade_design_system/components/button_icon/icon_button.dart';
import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/components/links/bp_link.dart';
import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/tokens/global_radius.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_header.dart';
import 'drag_handle.dart';

extension BottomSheetExtension on BuildContext {
  Future<T?> showBpBottomSheet<T>({
    required Widget Function(
            BuildContext context, ScrollController scrollController)
        contentBuilder,
    Widget? Function(BuildContext context)? footerBuilder,
    Widget? Function(BuildContext context)? headerBuilder,
    List<double>? snapSizes,
    double initialChildSize = 0.5,
    double minChildSize = 0.1,
    double maxChildSize = 0.9,
    String? title,
    String? subTitle,
    Widget? leading,
    BpCounter? titleSuffix,
    BpBadges? trailingBadge,
    Text? trailingText,
    BpLink? trailingLink,
    BpIconButton? trailingIcon,
    bool showBackButton = false,
    bool showHeader = true,
    bool snap = false,
  }) {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        // Wrap the child with DraggableScrollableSheet
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: DraggableScrollableSheet(
            snap: snap,
            snapSizes: snapSizes,
            maxChildSize: maxChildSize,
            minChildSize: minChildSize,
            initialChildSize: initialChildSize,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: GlobalRadius.xxLarge,
                    topRight: GlobalRadius.xxLarge,
                  ),
                ),
                child: Column(
                  children: [
                    DragHandle(
                      padding: showHeader
                          ? const EdgeInsets.symmetric(
                              vertical: Spacings.spacing4)
                          : const EdgeInsets.only(
                              top: Spacings.spacing4,
                              bottom: Spacings.spacing1),
                    ),
                    if (headerBuilder != null && showHeader)
                      headerBuilder(context)!
                    else if (showHeader)
                      BottomSheetHeader(
                        title: title,
                        subTitle: subTitle,
                        leading: leading,
                        titleSuffix: titleSuffix,
                        trailingBadge: trailingBadge,
                        trailingIcon: trailingIcon,
                        trailingLink: trailingLink,
                        trailingText: trailingText,
                        showBackButton: showBackButton,
                      ),
                    if (showHeader) ...{const BpDivider()},
                    contentBuilder(context, scrollController),
                    if (footerBuilder != null) ...{
                      const BpDivider(),
                      Padding(
                        padding: const EdgeInsets.all(Spacings.spacing5),
                        child: footerBuilder(context),
                      ),
                    },
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
