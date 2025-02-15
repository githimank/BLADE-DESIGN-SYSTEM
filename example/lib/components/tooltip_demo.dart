import 'package:blade_design_system/components/toottip/bp_tooltip.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class TooltipDemo extends StatefulWidget {
  const TooltipDemo({super.key});

  @override
  State<TooltipDemo> createState() => _TooltipDemoState();
}

class _TooltipDemoState extends State<TooltipDemo> {
  final GlobalKey targetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Tooltip Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
          ),
          const BpTooltip(
            heading: 'Tooltip Title',
            content: 'This section right here contains the  ',
            // 'text that goes inside of the tooltip. This section right here contains the  text that goes inside of the tooltip. This section right here contains the  text that goes inside of the tooltip. This section right here contains the  text that goes inside of the tooltip.',
            placement: TooltipPlacement.TOP,
            child: Text('Top'),
          ),
          Spacings.spacing6.hBox,
          const BpTooltip(
            heading: 'Tooltip Title',
            content:
                'This section right here contains the  text that goes inside of the tooltip.',
            placement: TooltipPlacement.BOTTOM,
            child: Text('Bottom'),
          ),
          Spacings.spacing6.hBox,
          const BpTooltip(
            heading: 'Tooltip Title',
            content:
                'This section right here contains the  text that goes inside of the tooltip.',
            placement: TooltipPlacement.RIGHT,
            child: Text(
              'Right',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Spacings.spacing6.hBox,
          const BpTooltip(
            // heading: 'Tooltip Title',
            content:
                'This section right here contains the  text that goes inside of the tooltip.',
            placement: TooltipPlacement.LEFT,
            child: Text(
              'Left',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Spacings.spacing6.hBox,
          BpTooltip(
            heading: 'Tooltip Title',
            content:
                'This section right here contains the  text that goes inside of the tooltip.',
            placement: TooltipPlacement.TOPSTART,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('TOPSTART')),
          ),
          Spacings.spacing6.hBox,
          BpTooltip(
            heading: 'Tooltip Title',
            content:
                'This section right here contains the  text that goes inside of the tooltip.',
            placement: TooltipPlacement.TOPEND,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('TOP END')),
          ),
          Spacings.spacing6.hBox,
          BpTooltip(
              isDisabled: true,
              heading: 'Tooltip Title',
              content: 'This section right',
              placement: TooltipPlacement.BOTTOMSTART,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('BOTTOMSTART'),
              )),
          Spacings.spacing6.hBox,
          BpTooltip(
            heading: 'Tooltip Title',
            content: 'This section right here contains',
            placement: TooltipPlacement.BOTTOMEND,
            child: SizedBox(
              width: 500,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('BOTTOMEND')),
            ),
          ),
          Spacings.spacing6.hBox,
          const BpTooltip(
            heading: 'Tooltip Title',
            content:
                'This section right here contains the text that goes inside of the tooltip. ',
            placement: TooltipPlacement.BOTTOM,
            child: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
