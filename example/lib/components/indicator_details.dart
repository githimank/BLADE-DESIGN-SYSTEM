import 'package:blade_design_system/components/indicator/bp_indicator.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class IndicatorDetails extends StatefulWidget {
  const IndicatorDetails({super.key});

  @override
  State<IndicatorDetails> createState() => _IndicatorDetailsState();
}

class _IndicatorDetailsState extends State<IndicatorDetails> {
  IndicatorLabelDotSize size = IndicatorLabelDotSize.SMALL;
  IntentMood mood = IntentMood.POSITIVE;
  IndicatorEmphasis emphasis = IndicatorEmphasis.SUBTLE;
  bool showLabel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Indicator Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacings.spacing3.wBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: IndicatorEmphasis.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Emphasis",
                  onSelected: (selectedVariant) {
                    setState(() {
                      emphasis = selectedVariant ?? IndicatorEmphasis.INTENSE;
                    });
                  },
                ),
                DropdownMenu(
                  dropdownMenuEntries: IndicatorLabelDotSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize ?? IndicatorLabelDotSize.LARGE;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: IntentMood.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Intent",
                  onSelected: (selectedMood) {
                    setState(() {
                      mood = selectedMood ?? IntentMood.POSITIVE;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: showLabel,
                onChanged: (selected) {
                  setState(() {
                    showLabel = selected ?? false;
                  });
                },
                title: const Text("Is showLabel?"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BpIndicator(
                  label: "Label",
                  size: size,
                  intent: mood,
                  showLabel: showLabel,
                  emphasis: emphasis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
