import 'package:blade_design_system/components/spinner/bp_spinner.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class SpinnerDetails extends StatefulWidget {
  const SpinnerDetails({super.key});

  @override
  State<SpinnerDetails> createState() => _SpinnerDetailsState();
}

class _SpinnerDetailsState extends State<SpinnerDetails> {
  SpinnerSize size = SpinnerSize.MEDIUM;
  bool showLabel = false;
  SpinnerMood mood = SpinnerMood.WHITE;
  LabelPosition labelPosition = LabelPosition.RIGHT;
  List<String> tags = [];
  final TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Spinner Details'),
        ),
        backgroundColor: Colors.pink.withOpacity(0.15),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: SpinnerSize.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Size",
                    onSelected: (selectedSize) {
                      setState(() {
                        size = selectedSize ?? SpinnerSize.MEDIUM;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: SpinnerMood.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Mood",
                    onSelected: (selectedMood) {
                      setState(() {
                        mood = selectedMood ?? SpinnerMood.WHITE;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: LabelPosition.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Label position",
                    onSelected: (selectedPosition) {
                      setState(() {
                        labelPosition = selectedPosition ?? LabelPosition.RIGHT;
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
                  title: const Text("show Label?"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              BpSpinner(
                size: size,
                mood: mood,
                label: showLabel ? "Loading..." : null,
                labelPosition: labelPosition,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}
