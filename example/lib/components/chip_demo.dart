import 'package:blade_design_system/components/chip/bp_chip.dart';
import 'package:blade_design_system/components/chip/bp_chip_enums.dart';
import 'package:blade_design_system/components/chip/bp_chip_group.dart';
import 'package:blade_design_system/components/chip/bp_chip_style.dart';
import 'package:blade_design_system/components/chip/bp_filter_chip.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({
    super.key,
  });

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  bool showLeadingIcon = false;
  ChipIntent intent = ChipIntent.PRIMARY;
  ChipSize size = ChipSize.MEDIUM;
  bool isDisabled = false;
  bool isChecked = false;

  final Widget icon = const Icon(
    Icons.task_alt,
    size: 16,
  );

  ChipLabelPosition position = ChipLabelPosition.Top;
  ChipValidationState validationState = ChipValidationState.NONE;
  ChipSelectionType selectionType = ChipSelectionType.SINGLE;
  ChipNecessityIndicator necessityIndicator = ChipNecessityIndicator.OPTIONAL;

  List<String> selectedChips = [];

  void handleChipSelection(String chip, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedChips.add(chip);
      } else {
        selectedChips.remove(chip);
      }
    });
    print('Selected Chips: $selectedChips');
  }

  final List<BpChipData<String>> chipData = [
    BpChipData(
      value: 'Option 1',
      label: 'Option 1',
      icon: const Icon(Icons.task_alt, size: 16),
      isDisabled: false,
      intent: ChipIntent.POSITIVE,
    ),
    BpChipData(
      value: 'Option 2',
      label: 'Option 2',
      icon: const Icon(Icons.access_alarm, size: 16),
    ),
    BpChipData(
      value: 'Option 3',
      label: 'Option 3',
      icon: const Icon(Icons.check_circle, size: 16),
    ),
  ];

  final value = ['Option 1'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 900;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Badge Details'),
        leading: !isDesktop
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xFF301C33),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : null,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: ChipIntent.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Chip Intent",
                    onSelected: (selectedChipIntent) {
                      setState(() {
                        intent = selectedChipIntent ?? ChipIntent.PRIMARY;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: ChipSize.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Size",
                    onSelected: (selectedSize) {
                      setState(() {
                        size = selectedSize ?? ChipSize.MEDIUM;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: ChipLabelPosition.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select Position",
                    onSelected: (selectedPosition) {
                      setState(() {
                        position = selectedPosition ?? ChipLabelPosition.Left;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: ChipValidationState.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select ValidationState",
                    onSelected: (selectedValidationState) {
                      setState(() {
                        validationState =
                            selectedValidationState ?? ChipValidationState.NONE;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: ChipSelectionType.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select SelectionType",
                    onSelected: (selectedSelectionType) {
                      setState(() {
                        selectionType =
                            selectedSelectionType ?? ChipSelectionType.MULTIPLE;
                      });
                    },
                  ),
                  Spacings.spacing3.wBox,
                  DropdownMenu(
                    dropdownMenuEntries: ChipNecessityIndicator.values
                        .map((it) =>
                            DropdownMenuEntry(value: it, label: it.name))
                        .toList(),
                    width: 200,
                    hintText: "Select NecessityIndicator",
                    onSelected: (selectedNecessityIndicator) {
                      setState(() {
                        necessityIndicator = selectedNecessityIndicator ??
                            ChipNecessityIndicator.NONE;
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
              BpFilterChip(
                label: 'Option 1',
                icon: icon,
                isDisabled: isDisabled,
                intent: intent,
                onSelected: (isSelected) {
                  setState(() {
                    isChecked = isSelected;
                  });
                  print('Chip is ${isSelected ? 'selected' : 'deselected'}');
                },
                chipSize: size,
                isChecked: isChecked,
              ),
              Spacings.spacing6.hBox,
              BpChip(
                label: 'Option 1',
                icon: icon,
                isDisabled: isDisabled,
                intent: intent,
                // isChecked: false, // Enable false to show Default color
                chipSize: size,
              ),
              BpChipGroup(
                labelPosition: position,
                label: 'Select Options',
                validationState: validationState,
                selectionType: selectionType,
                size: size,
                isRequired: true,
                onChange: (selectedChips) {
                  print('Selected Chips: $selectedChips');
                  value.clear();
                  value.addAll(selectedChips);
                  setState(() {});
                },
                necessityIndicator: necessityIndicator,
                color: intent,
                errorText: 'Error',
                helpText: 'Please select at least one option.',
                selectedValue: value,
                children: chipData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
