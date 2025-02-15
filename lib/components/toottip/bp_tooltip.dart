import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/borders.dart';
import 'package:blade_design_system/theme/tokens/elevations.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

enum TooltipPlacement {
  TOP,
  BOTTOM,
  LEFT,
  RIGHT,
  TOPSTART,
  TOPEND,
  BOTTOMSTART,
  BOTTOMEND,
}

class BpTooltip extends StatefulWidget {
  final Widget child;
  final String? heading;
  final String content;
  final TooltipPlacement placement;
  final bool isDisabled;
  const BpTooltip({
    super.key,
    required this.child,
    this.heading,
    required this.content,
    this.isDisabled = false,
    this.placement = TooltipPlacement.TOP,
  });

  @override
  State<BpTooltip> createState() => _BpTooltipState();
}

class _BpTooltipState extends State<BpTooltip> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool isVisible = false;
  final GlobalKey _tooltipKey = GlobalKey();
  final Size arrowSize = Size(14, 7);
  bool _isBuilding = false;
  void _showTooltip() async {
    if (widget.isDisabled) {
      return;
    }
    if (isVisible) return; // Prevent duplicate calls

    _isBuilding = true; // Mark that the tooltip is being built
    _overlayEntry = await _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _isBuilding = false; // Tooltip is now built
    setState(() {
      isVisible = true;
    });
  }

  void _hideTooltip() async {
    if (widget.isDisabled) {
      return;
    }
    if (_isBuilding) {
      await Future.delayed(
          const Duration(milliseconds: 10)); // Wait for build to complete
    }

    if (!isVisible) return; // Ensure it's actually visible before hiding

    _overlayEntry?.remove();
    _overlayEntry = null;

    setState(() {
      isVisible = false;
    });
  }

  Future<OverlayEntry> _createOverlayEntry() async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size buttonSize = renderBox.size;
    final Offset buttonOffset = renderBox.localToGlobal(Offset.zero);
    print('Content Length : ${widget.content.length}');

    final overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: 0,
        left: 0,
        child: Material(
            color: Colors.transparent,
            child: Offstage(child: _buildTooltipContent(true))),
      );
    });
    Overlay.of(context).insert(overlayEntry);
    await Future.delayed(const Duration(milliseconds: 10));

    final RenderBox? tooltipRenderBox =
    _tooltipKey.currentContext?.findRenderObject() as RenderBox?;
    final tooltipSize = tooltipRenderBox?.size;
    overlayEntry.remove();

    double tooltipHeight = tooltipSize?.height ?? _calculateTooltipHeight();
    final double tooltipMaxWidth = tooltipSize?.width ?? 224;

    // Assuming you have access to the screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate available space
    double availableSpaceTop = buttonOffset.dy;
    double availableSpaceBottom =
        screenHeight - (buttonOffset.dy + buttonSize.height);
    double availableSpaceLeft = buttonOffset.dx;
    double availableSpaceRight =
        screenWidth - (buttonOffset.dx + buttonSize.width);

    // Determine the best placement for the tooltip
    TooltipPlacement placement = _determinePlacement(
      availableSpaceTop,
      availableSpaceBottom,
      availableSpaceLeft,
      availableSpaceRight,
      tooltipHeight,
      tooltipMaxWidth,
    );

    // Calculate the position based on the determined placement
    Offset tooltipPosition = _calculateTooltipPosition(
      placement,
      buttonOffset,
      buttonSize,
      tooltipHeight,
      tooltipMaxWidth,
    );

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: tooltipPosition.dy,
              left: tooltipPosition.dx,
              child: Material(
                  color: context.colorTheme.transparent,
                  child: CustomPaint(
                      size: Size(tooltipSize!.width, tooltipSize.height),
                      // key: isOffstage ? _tooltipKey : null,
                      painter: TooltipArrowPainter(
                          placement: placement ?? widget.placement,
                          color: context.colorTheme.popup.background.intense,
                          parentSize: buttonSize,
                          parentOffset: buttonOffset,
                          tooltipOffset: tooltipPosition),
                      child: _buildTooltipContent())

                // _buildTooltipContent(false, placement),
              ),
            ),
          ],
        );
      },
    );
  }

  double _calculateTooltipHeight() {
    // Logic to calculate tooltip height based on content length and heading
    if (widget.content.length == 32) {
      return widget.heading == null ? 35 : 60;
    } else if (widget.content.length <= 99) {
      return widget.heading == null
          ? (widget.content.length <= 40 ? 35 : 55)
          : 70;
    } else {
      return 102;
    }
  }

  TooltipPlacement _determinePlacement(
      double availableSpaceTop,
      double availableSpaceBottom,
      double availableSpaceLeft,
      double availableSpaceRight,
      double tooltipHeight,
      double tooltipMaxWidth,
      ) {
    // Check preferred placement
    TooltipPlacement placement = widget.placement;
    bool isPreferredPlacementValid = false;

    if (placement == TooltipPlacement.TOP) {
      isPreferredPlacementValid = availableSpaceTop >= tooltipHeight;
    } else if (placement == TooltipPlacement.BOTTOM) {
      isPreferredPlacementValid = availableSpaceBottom >= tooltipHeight;
    } else if (placement == TooltipPlacement.LEFT) {
      isPreferredPlacementValid = availableSpaceLeft >= tooltipMaxWidth;
    } else if (placement == TooltipPlacement.RIGHT) {
      isPreferredPlacementValid = availableSpaceRight >= tooltipMaxWidth;
    }

    // else if(placement== TooltipPlacement.TOPSTART){
    //   `
    // }

    // Fallback logic
    if (!isPreferredPlacementValid) {
      if (placement == TooltipPlacement.TOP) {
        if (availableSpaceBottom >= tooltipHeight) {
          placement = TooltipPlacement.BOTTOM;
        } else if (availableSpaceLeft >= tooltipMaxWidth) {
          placement = TooltipPlacement.LEFT;
        } else if (availableSpaceRight >= tooltipMaxWidth) {
          placement = TooltipPlacement.RIGHT;
        }
      } else if (placement == TooltipPlacement.BOTTOM) {
        if (availableSpaceTop >= tooltipHeight) {
          placement = TooltipPlacement.TOP;
        } else if (availableSpaceLeft >= tooltipMaxWidth) {
          placement = TooltipPlacement.LEFT;
        } else if (availableSpaceRight >= tooltipMaxWidth) {
          placement = TooltipPlacement.RIGHT;
        }
      } else if (placement == TooltipPlacement.LEFT) {
        if (availableSpaceRight >= tooltipMaxWidth) {
          placement = TooltipPlacement.RIGHT;
        } else if (availableSpaceTop >= tooltipHeight) {
          placement = TooltipPlacement.TOP;
        } else if (availableSpaceBottom >= tooltipHeight) {
          placement = TooltipPlacement.BOTTOM;
        }
      } else if (placement == TooltipPlacement.RIGHT) {
        if (availableSpaceLeft >= tooltipMaxWidth) {
          placement = TooltipPlacement.LEFT;
        } else if (availableSpaceTop >= tooltipHeight) {
          placement = TooltipPlacement.TOP;
        } else if (availableSpaceBottom >= tooltipHeight) {
          placement = TooltipPlacement.BOTTOM;
        }
      }
    }

    return placement;
  }

  Offset _calculateTooltipPosition(
      TooltipPlacement placement,
      Offset buttonOffset,
      Size buttonSize,
      double tooltipHeight,
      double tooltipMaxWidth,
      ) {
    final gap = 8;
    double positionLeft =
        buttonOffset.dx + (buttonSize.width / 2) - (tooltipMaxWidth / 2);
    double positionTop =
        buttonOffset.dy + (buttonSize.height / 2) - (tooltipHeight / 2);

    if (placement == TooltipPlacement.RIGHT) {
      positionLeft = buttonOffset.dx + buttonSize.width + gap;
    } else if (placement == TooltipPlacement.LEFT) {
      positionLeft = buttonOffset.dx - tooltipMaxWidth - gap;
    } else if (placement == TooltipPlacement.BOTTOM) {
      positionTop = buttonOffset.dy + buttonSize.height + gap;
    } else if (placement == TooltipPlacement.TOP) {
      positionTop = buttonOffset.dy - tooltipHeight - gap;
    } else if (placement == TooltipPlacement.TOPSTART) {
      positionLeft = buttonOffset.dx;
      positionTop = buttonOffset.dy - tooltipHeight - gap;
      if (tooltipMaxWidth > buttonSize.width) {
        positionLeft -= (gap * 1.5);
      }
    } else if (placement == TooltipPlacement.TOPEND) {
      positionLeft = buttonOffset.dx + buttonSize.width - tooltipMaxWidth;
      positionTop = buttonOffset.dy - tooltipHeight - gap;
      if (tooltipMaxWidth > buttonSize.width) {
        positionLeft += (gap * 1.5);
      }
    } else if (placement == TooltipPlacement.BOTTOMSTART) {
      positionLeft = buttonOffset.dx;
      positionTop = buttonOffset.dy + buttonSize.height + gap;
      if (tooltipMaxWidth > buttonSize.width) {
        positionLeft -= (gap * 1.5);
      }
    } else if (placement == TooltipPlacement.BOTTOMEND) {
      positionLeft = buttonOffset.dx + buttonSize.width - tooltipMaxWidth;
      positionTop = buttonOffset.dy + buttonSize.height + gap;
      if (tooltipMaxWidth > buttonSize.width) {
        positionLeft += (gap * 1.5);
      }
    }

    // Ensure the tooltip is within screen bounds
    positionLeft = positionLeft.clamp(
        0, MediaQuery.of(context).size.width - tooltipMaxWidth);
    positionTop = positionTop.clamp(
        0, MediaQuery.of(context).size.height - tooltipHeight);

    return Offset(positionLeft, positionTop);
  }

  Widget _buildTooltipContent([bool isOffstage = false]) {
    return Container(
      key: isOffstage ? _tooltipKey : null,
      constraints: const BoxConstraints(maxWidth: 224),
      padding: const EdgeInsets.all(Spacings.spacing4),
      decoration: BoxDecoration(
          color: context.colorTheme.popup.background.intense,
          borderRadius: Borders.radii.medium,
          border: Border.all(
              color: context.colorTheme.popup.border.intense,
              width: Borders.widths.thinner),
          boxShadow: Elevations.lowRaised),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.heading != null) ...[
            Flexible(
              child: Text(
                widget.heading ?? '',
                textAlign: TextAlign.left,
                style: context.appTypography.bodyMedium.semiBold?.copyWith(
                  color: context.colorTheme.surface.text.staticWhite.normal,
                ),
              ),
            ),
            Spacings.spacing2.hBox,
          ],
          Text(
            widget.content,
            textAlign: TextAlign.left,
            style: context.appTypography.bodySmall.regular?.copyWith(
              color: context.colorTheme.surface.text.staticWhite.subtle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _showTooltip(),
        onExit: (_) => _hideTooltip(),
        child: widget.child,
      ),
    );
  }
}

class TooltipArrowPainter extends CustomPainter {
  final TooltipPlacement placement;
  final Color color;
  final Offset parentOffset;
  final Size parentSize;
  final Offset tooltipOffset;
  TooltipArrowPainter({
    required this.placement,
    required this.color,
    required this.parentSize,
    required this.parentOffset,
    required this.tooltipOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double arrowSize = 8.0;
    final Path path = Path();
    final double minArrowX = arrowSize;
    final double maxArrowX = size.width - arrowSize;
    switch (placement) {
      case TooltipPlacement.LEFT:
        final startWidth = (parentOffset.dx - tooltipOffset.dx) - arrowSize;
        final startHeight =
            ((parentSize.height / 2) + parentOffset.dy) - tooltipOffset.dy;
        path.moveTo(startWidth, startHeight - arrowSize);
        path.lineTo(startWidth, startHeight + arrowSize);
        path.lineTo(startWidth + arrowSize, startHeight);
        break;
      case TooltipPlacement.RIGHT:
        final startWidth =
            (parentOffset.dx - tooltipOffset.dx) + parentSize.width + arrowSize;
        final startHeight =
            ((parentSize.height / 2) + parentOffset.dy) - tooltipOffset.dy;
        path.moveTo(startWidth, startHeight - arrowSize);
        path.lineTo(startWidth, startHeight + arrowSize);
        path.lineTo(startWidth - arrowSize, startHeight);
        break;
      case TooltipPlacement.TOPSTART:
        double startWidth =
        parentSize.width > (arrowSize * 2) ? arrowSize * 2 : 0;
        startWidth = startWidth.clamp(minArrowX, maxArrowX);
        path.moveTo(startWidth - arrowSize, size.height);
        path.lineTo(startWidth + arrowSize, size.height);
        path.lineTo(startWidth, size.height + arrowSize);
        break;
      case TooltipPlacement.TOPEND:
        double startWidth = parentSize.width > (arrowSize * 2)
            ? size.width - (arrowSize * 2.5)
            : ((parentSize.width / 2) + parentOffset.dx) - tooltipOffset.dx;
        startWidth = startWidth.clamp(minArrowX, maxArrowX);
        path.moveTo(startWidth - arrowSize, size.height);
        path.lineTo(startWidth + arrowSize, size.height);
        path.lineTo(startWidth, size.height + arrowSize);
        break;
      case TooltipPlacement.TOP:
        final startWidth =
            parentOffset.dx + (parentSize.width / 2) - tooltipOffset.dx;
        path.moveTo(startWidth - arrowSize, size.height);
        path.lineTo(startWidth + arrowSize, size.height);
        path.lineTo(startWidth, size.height + arrowSize);
        break;
      case TooltipPlacement.BOTTOMSTART:
        double startWidth =
        parentSize.width > (arrowSize * 2) ? arrowSize * 2 : 0;

        startWidth = startWidth.clamp(minArrowX, maxArrowX);
        path.moveTo(startWidth - arrowSize, 0);
        path.lineTo(startWidth + arrowSize, 0);
        path.lineTo(startWidth, -arrowSize);
        break;
      case TooltipPlacement.BOTTOMEND:
        double startWidth = parentSize.width > (arrowSize * 2)
            ? size.width - (arrowSize * 2.5)
            : ((parentSize.width / 2) + parentOffset.dx) - tooltipOffset.dx;

        startWidth = startWidth.clamp(minArrowX, maxArrowX);
        path.moveTo(startWidth - arrowSize, 0);
        path.lineTo(startWidth + arrowSize, 0);
        path.lineTo(startWidth, -arrowSize);
        break;
      case TooltipPlacement.BOTTOM:
        final startWidth =
            parentOffset.dx + (parentSize.width / 2) - tooltipOffset.dx;

        path.moveTo(startWidth - arrowSize, 0);
        path.lineTo(startWidth + arrowSize, 0);
        path.lineTo(startWidth, -arrowSize);
        break;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
