import 'package:blade_design_system/components/checkbox/bp_checkbox.dart';
import 'package:blade_design_system/components/checkbox/bp_checkbox_group.dart';
import 'package:blade_design_system/components/checkbox/checkbox_enums.dart';
import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool isDashed = false;
  bool isDisabled = false;
  bool isIntermediate = false;
  bool isChecked = false;
  bool isRequired = false;
  CheckboxSize size = CheckboxSize.LARGE;
  CheckBoxValidationState checkBoxValidationState =
      CheckBoxValidationState.NONE;
  CheckboxNecessityIndicator checkboxNecessityIndicator =
      CheckboxNecessityIndicator.REQUIRED;

  List<String> selectedValues = [];

  final List<CheckboxData<String>> checkboxData = [
    CheckboxData(
      Key: 'Option 1',
      checkBoxLabel: 'Option 1',
      isDisabled: false,
    ),
    CheckboxData(
      Key: 'Option 2',
      checkBoxLabel: 'Option 2',
      isDisabled: false,
    ),
    CheckboxData(
      Key: 'Option 3',
      checkBoxLabel: 'Option 3',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('CheckBox Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: CheckboxSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize ?? CheckboxSize.LARGE;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: CheckBoxValidationState.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select CheckBoxValidationState",
                  onSelected: (selectedCheckBoxValidationState) {
                    setState(() {
                      checkBoxValidationState =
                          selectedCheckBoxValidationState ??
                              CheckBoxValidationState.NONE;
                    });
                  },
                ),
                DropdownMenu(
                  dropdownMenuEntries: CheckboxNecessityIndicator.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select NecessityIndicator",
                  onSelected: (selectedNecessityIndicator) {
                    setState(() {
                      checkboxNecessityIndicator = selectedNecessityIndicator ??
                          CheckboxNecessityIndicator.REQUIRED;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isDashed,
                onChanged: (selected) {
                  setState(() {
                    isDashed = selected ?? true;
                  });
                },
                title: const Text("Is isIndeterminate?"),
              ),
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isIntermediate,
                onChanged: (selected) {
                  setState(() {
                    isIntermediate = selected ?? false;
                  });
                },
                title: const Text("Is isIntermediate?"),
              ),
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isChecked,
                onChanged: (selected) {
                  setState(() {
                    isChecked = selected ?? false;
                  });
                },
                title: const Text("Is isChecked?"),
              ),
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isDisabled,
                onChanged: (selected) {
                  setState(() {
                    isDisabled = selected ?? false;
                  });
                },
                title: Text("Is Disabled?"),
              ),
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isRequired,
                onChanged: (selected) {
                  setState(() {
                    isRequired = selected ?? false;
                  });
                },
                title: Text("Is Required?"),
              ),
            ),
            BpCheckbox(
              isChecked: isChecked,
              isIndeterminate: isDashed,
              isDisabled: isDisabled,
              isIntermediate: isIntermediate,
              checkBoxValidationState: checkBoxValidationState,
              size: size,
              checkBoxLabel: 'I have accepted the business agreement',
              helpTextCheckbox: 'Helper Text',
              errorText: "Please check the box to confirm acceptance of the business agreement. ",
              onChanged: (bool? newValue) {
                print('Checkbox value changed: $newValue');
              },
              isRequired: isRequired,
              // necessityIndicator: checkboxNecessityIndicator,
            ),
            Spacings.spacing8.hBox,
            const BpDivider(
              length: 400,
            ),
            Spacings.spacing8.hBox,
            const Text(
              "CheckBox Group Example",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Spacings.spacing3.hBox,
            BpCheckboxGroup(
              label: 'Choose Options',
              helpText: 'Select one or more options.',
              errorText: 'Please select at least one option',
              isRequired: isRequired,
              size: size,
              onChange: (selectedCheckbox) {
                print('Selected Checkboxes: $selectedCheckbox');
              },
              necessityIndicator: checkboxNecessityIndicator,
              children: checkboxData,
            ),
          ],
        ),
      ),
    );
  }
}
