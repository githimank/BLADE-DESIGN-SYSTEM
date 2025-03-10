import 'package:blade_design_system/components/accordian/accordion_data.dart';
import 'package:blade_design_system/components/accordian/accordion_enum.dart';
import 'package:blade_design_system/components/accordian/bp_accordion.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class AccordionDetails extends StatefulWidget {
  const AccordionDetails({super.key});

  @override
  State<AccordionDetails> createState() => _AccordionDetailsState();
}

class _AccordionDetailsState extends State<AccordionDetails> {
  AccordionSize size = AccordionSize.LARGE;
  AccordianVariant? variant;
  bool isDisabled = false;
  bool showNumberPrefix = false;
  final Widget icon = const Icon(Icons.health_and_safety_rounded);
  final Widget trailing = const Icon(Icons.add);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tag Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AccordianVariant.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Variant",
                  onSelected: (value) {
                    setState(() {
                      variant = value!;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AccordionSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize!;
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
                    value: showNumberPrefix,
                    onChanged: (selected) {
                      setState(() {
                        showNumberPrefix = selected ?? false;
                      });
                    },
                    title: const Text("Show number prefix?"),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: CheckboxListTile(
                    value: isDisabled,
                    onChanged: (selected) {
                      setState(() {
                        isDisabled = selected ?? false;
                      });
                    },
                    title: const Text("Is Disabled?"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 600,
                    child: BpAccordion(
                      showNumberPrefix: showNumberPrefix,
                      variant: variant ?? AccordianVariant.TRANSPARENT,
                      size: size,
                      accordions: [
                        // Basic with title and body
                        AccordionData(
                          title: 'Accordion 1',
                          description:
                              'This is the body content of Accordion 1.',
                        ),
                        // With title, body, and header
                        AccordionData(
                          title: 'Accordion 2',
                          body:
                              Text('This is the body content of Accordion 2.'),
                          header: Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 8),
                              Text('Custom Header for Accordion 2'),
                            ],
                          ),
                        ),
                        // With leading widget
                        AccordionData(
                          title: 'Accordion 3',
                          body:
                              Text('This is the body content of Accordion 3.'),
                          leading: Icon(Icons.label),
                        ),
                        // With trailing widget
                        AccordionData(
                          title: 'Accordion 4',
                          body:
                              Text('This is the body content of Accordion 4.'),
                          trailing: Icon(Icons.arrow_forward),
                        ),
                        // With title prefix
                        AccordionData(
                          title: 'Accordion 5',
                          body:
                              Text('This is the body content of Accordion 5.'),
                          titleSuffix: Icon(Icons.info),
                        ),
                        // With subtitle
                        AccordionData(
                          title: 'Accordion 6',
                          subtitle: 'Subtitle for Accordion 6',
                          body:
                              Text('This is the body content of Accordion 6.'),
                        ),
                        // With description
                        AccordionData(
                          title: 'Accordion 7',
                          description: 'Description for Accordion 7',
                          body:
                              Text('This is the body content of Accordion 7.'),
                        ),
                        // Initially expanded
                        AccordionData(
                          title: 'Accordion 8',
                          body: Text('This accordion is initially expanded.'),
                          isInitiallyExpanded: true,
                        ),
                        // Disabled accordion
                        AccordionData(
                          title: 'Accordion 9',
                          body: Text('This accordion is disabled.'),
                          isDisabled: isDisabled,
                        ),
                        // With onExpandChange callback
                        AccordionData(
                          title: 'Accordion 10',
                          body: Text(
                              'This accordion triggers a callback on expand/collapse.'),
                          onExpandChange: (index) =>
                              print('Accordion $index expanded/collapsed.'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
