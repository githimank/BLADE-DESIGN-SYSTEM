import 'package:blade_design_system/components/progress_bar/bp_progress_bar.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class ProgressbarDetails extends StatefulWidget {
  const ProgressbarDetails({super.key});

  @override
  State<ProgressbarDetails> createState() => _ProgressbarDetailsState();
}

class _ProgressbarDetailsState extends State<ProgressbarDetails> {
  ProgressBarIntent intent = ProgressBarIntent.NONE;
  ProgressBarSize size = ProgressBarSize.LARGE;
  double value = 10;

  bool isIndeterminate = false;
  bool showLabel = false;
  bool showPercentage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Bar Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DropdownMenu(
                dropdownMenuEntries: ProgressBarIntent.values
                    .map((it) => DropdownMenuEntry(value: it, label: it.name))
                    .toList(),
                width: 200,
                hintText: "Select Intent",
                onSelected: (selectedMood) {
                  setState(() {
                    intent = selectedMood!;
                  });
                },
              ),
              Spacings.spacing2.wBox,
              DropdownMenu(
                dropdownMenuEntries: ProgressBarSize.values
                    .map((it) => DropdownMenuEntry(value: it, label: it.name))
                    .toList(),
                width: 200,
                hintText: "Select Size",
                onSelected: (selectedMood) {
                  setState(() {
                    size = selectedMood!;
                  });
                },
              ),
              Spacings.spacing2.wBox,
              DropdownMenu(
                dropdownMenuEntries: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
                    .map((it) =>
                        DropdownMenuEntry(value: it, label: it.toString()))
                    .toList(),
                width: 200,
                hintText: "Select value",
                onSelected: (selectedMood) {
                  setState(() {
                    value = selectedMood!.toDouble();
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: CheckboxListTile(
                  value: isIndeterminate,
                  onChanged: (selected) {
                    setState(() {
                      isIndeterminate = selected ?? false;
                    });
                  },
                  title: const Text("Is Indeterminate?"),
                ),
              ),
              Spacings.spacing2.wBox,
              SizedBox(
                width: 200,
                child: CheckboxListTile(
                  value: showLabel,
                  onChanged: (selected) {
                    setState(() {
                      showLabel = selected ?? false;
                    });
                  },
                  title: const Text("show label?"),
                ),
              ),
              Spacings.spacing2.wBox,
              SizedBox(
                width: 200,
                child: CheckboxListTile(
                  value: showPercentage,
                  onChanged: (selected) {
                    setState(() {
                      showPercentage = selected ?? false;
                    });
                  },
                  title: const Text("show percentage?"),
                ),
              ),
            ],
          ),
          // Spacings.spacing6.hBox,
          Spacings.spacing6.hBox,
          Spacings.spacing6.hBox,
          Spacings.spacing6.hBox,
          Spacings.spacing6.hBox,
          Spacings.spacing6.hBox,
          Spacings.spacing6.hBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: BpProgressBar(
              label: showLabel ? 'Show Label' : null,
              showPercentage: showPercentage,
              size: size,
              intent: intent,
              value: value / 100,
              isIndeterminate: isIndeterminate,
            ),
          )
        ],
      ),
    );
  }
}
