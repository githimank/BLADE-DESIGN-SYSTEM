import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/components/radio/bp_radio.dart';
import 'package:blade_design_system/components/radio/bp_radio_group.dart';
import 'package:blade_design_system/components/radio/radio_enum.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  bool? selectedValue;

  RadioSize size = RadioSize.MEDIUM;
  RadioValidationState validationState = RadioValidationState.NONE;
  RadioNecessityIndicator necessityIndicator = RadioNecessityIndicator.NONE;
  Axis axis = Axis.vertical;
  bool isDisabled = false;
  bool isRequired = false;

  final List<BpRadioData<String>> radioData = [
    BpRadioData(label: 'Product Name Product Name', value: '1'),
    BpRadioData(label: 'SKU', value: '2'),
    BpRadioData(label: 'Option 3', value: '3'),
  ];

  // Store the selected values
  String? selectValue;

  void handleRadioChange(String? value) {
    setState(() {
      selectValue = value;
    });

    print('Selected Value: ${selectValue}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Radio Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: RadioValidationState.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select ValidationState",
                    onSelected: (selectedValidationState) {
                      setState(() {
                        validationState = selectedValidationState ??
                            RadioValidationState.NONE;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: RadioSize.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Size",
                    onSelected: (selectedSize) {
                      setState(() {
                        size = selectedSize ?? RadioSize.LARGE;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: RadioNecessityIndicator.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select NecessityIndicator",
                    onSelected: (selectedNecessityIndicator) {
                      setState(() {
                        necessityIndicator = selectedNecessityIndicator ??
                            RadioNecessityIndicator.NONE;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: Axis.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Axis",
                    onSelected: (selectedAxis) {
                      setState(() {
                        axis = selectedAxis ?? Axis.vertical;
                      });
                    },
                  ),
                ],
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
              SizedBox(
                width: 200,
                child: CheckboxListTile(
                  value: isRequired,
                  onChanged: (selected) {
                    setState(() {
                      isRequired = selected ?? false;
                    });
                  },
                  title: const Text("Is Required?"),
                ),
              ),
              BpRadio(
                label: 'Option 1',
                isDisabled: isDisabled,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                isSelected: selectedValue == true,
                validationState: validationState,
                size: size,
              ),
              Spacings.spacing3.hBox,
              Text(
                'Selected Value: ${selectedValue ?? 'None'}',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Spacings.spacing5.hBox,
              const BpDivider(
                length: 400,
              ),
              Spacings.spacing5.hBox,
              RadioGroup(
                axis: axis,
                label: 'Search By Search By Search By',
                helpText: 'This is a helpful text.',
                errorText: 'Please select an option.',
                selectedValue: selectValue,
                onChanged: handleRadioChange,
                validationState: validationState,
                necessityIndicator: necessityIndicator,
                isRequired: isRequired,
                size: size,
                children: radioData,
                isDisabled: isDisabled,
                labelOptionGap: 20,
                optionGapHorizontal: Spacings.spacing4,
                optionGapVertical: Spacings.spacing4,
                maxWidthForLabel: 150.0,
                maxWidthForOption: 150.0,
              ),
              Spacings.spacing3.hBox,
              Text(
                'Selected Value From Group : ${selectValue ?? 'None'}',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
