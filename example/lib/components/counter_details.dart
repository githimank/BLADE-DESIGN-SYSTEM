import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/components/button/button_widget.dart';
import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class CounterDetails extends StatefulWidget {
  const CounterDetails({super.key});

  @override
  State<CounterDetails> createState() => _CounterDetailsState();
}

class _CounterDetailsState extends State<CounterDetails> {
  CounterEmphasis emphasis = CounterEmphasis.INTENSE;
  CounterMood mood = CounterMood.PRIMARY;
  CounterSize size = CounterSize.LARGE;

  final TextEditingController counterController = TextEditingController();
  final TextEditingController counterValueController = TextEditingController();

  int? maxValue;
  int? counterValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Counter Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: CounterEmphasis.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Type",
                  onSelected: (selectedVariant) {
                    setState(() {
                      emphasis = selectedVariant ?? CounterEmphasis.INTENSE;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: CounterMood.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Mood",
                  onSelected: (selectedMood) {
                    setState(() {
                      mood = selectedMood ?? CounterMood.PRIMARY;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: CounterSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize ?? CounterSize.LARGE;
                    });
                  },
                ),
                Spacings.spacing11.hBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: counterController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Max Value',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ButtonWidget(
                      size: ButtonSize.LARGE,
                      label: "Set Max",
                      mood: ButtonMood.PRIMARY,
                      onTap: () {
                        if (counterController.text.isNotEmpty) {
                          final int? parsedValue =
                              int.tryParse(counterController.text);
                          if (parsedValue != null) {
                            setState(() {
                              maxValue = parsedValue;
                              counterController.clear();
                            });
                          }
                        }
                      },
                      variant: ButtonVariant.PRIMARY,
                    ),
                  ],
                ),
                Spacings.spacing11.hBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: counterValueController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Counter Value',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ButtonWidget(
                      size: ButtonSize.LARGE,
                      label: "Create",
                      mood: ButtonMood.PRIMARY,
                      onTap: () {
                        if (counterValueController.text.isNotEmpty) {
                          final int? parsedValue =
                              int.tryParse(counterValueController.text);
                          if (parsedValue != null) {
                            setState(() {
                              counterValue = parsedValue;
                              counterValueController.clear();
                            });
                          }
                        }
                      },
                      variant: ButtonVariant.PRIMARY,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BpCounter(
              size: size,
              label: counterValue ?? 0,
              mood: mood,
              emphasis: emphasis,
              max: maxValue,
            ),
          ],
        ),
      ),
    );
  }
}
