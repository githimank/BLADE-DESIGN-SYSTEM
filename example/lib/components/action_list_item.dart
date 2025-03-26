import 'package:blade_design_system/components/action_list_item/action_list_item.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class ActionListItemDetails extends StatefulWidget {
  const ActionListItemDetails({super.key});

  @override
  State<ActionListItemDetails> createState() => _ActionListItemDetailsState();
}

class _ActionListItemDetailsState extends State<ActionListItemDetails> {
  ActionListItemContentType contentType =
      ActionListItemContentType.ACTIONLISTITEM;
  ActionListItemSelectionType selectionType =
      ActionListItemSelectionType.SINGLE;
  IconData? leadingIcon;
  IconData? trailingIcon;
  bool isDisabled = false;
  bool isSelected = false;
  bool isDestructive = false;
  String title = 'Action List Item';
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action List Item Details'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: double.maxFinite,
        ),
        Wrap(
          children: [
            Spacings.spacing3.wBox,
            DropdownMenu(
              dropdownMenuEntries: ActionListItemContentType.values
                  .map((it) => DropdownMenuEntry(value: it, label: it.name))
                  .toList(),
              width: 200,
              hintText: "Select Content type",
              onSelected: (selectedContentType) {
                setState(() {
                  contentType = selectedContentType ??
                      ActionListItemContentType.ACTIONLISTITEM;
                });
              },
            ),
            Spacings.spacing3.wBox,
            DropdownMenu(
              dropdownMenuEntries: ActionListItemSelectionType.values
                  .map((it) => DropdownMenuEntry(value: it, label: it.name))
                  .toList(),
              width: 200,
              hintText: "Select Selection type",
              onSelected: (selectedSelectionType) {
                setState(() {
                  selectionType = selectedSelectionType ??
                      ActionListItemSelectionType.SINGLE;
                });
              },
            ),
            Spacings.spacing3.wBox,
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
            Spacings.spacing3.wBox,
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: isDestructive,
                onChanged: (distructive) {
                  setState(() {
                    isDestructive = distructive ?? false;
                  });
                },
                title: const Text("Is Distructive?"),
              ),
            ),
            Spacings.spacing3.wBox,
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: isSelected,
                onChanged: (selected) {
                  setState(() {
                    isSelected = selected ?? false;
                  });
                },
                title: const Text("Is Selected?"),
              ),
            ),
            Spacings.spacing3.wBox,
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: description != null,
                onChanged: (selected) {
                  setState(() {
                    description = selected == true
                        ? "description for the action list"
                        : null;
                  });
                },
                title: const Text("show Description?"),
              ),
            ),
            Spacings.spacing3.wBox,
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: leadingIcon != null,
                onChanged: (selected) {
                  setState(() {
                    leadingIcon = selected == true ? Icons.ac_unit : null;
                  });
                },
                title: const Text("show leading?"),
              ),
            ),
            Spacings.spacing3.wBox,
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: trailingIcon != null,
                onChanged: (selected) {
                  setState(() {
                    trailingIcon = selected == true ? Icons.text_fields : null;
                  });
                },
                title: const Text("show trailing?"),
              ),
            ),
          ],
        ),
        Spacings.spacing5.hBox,
        SizedBox(
          width: 500,
          child: ActionListItem(
            contentType: contentType,
            selectionType: selectionType,
            isDisabled: isDisabled,
            isSelected: isSelected,
            isDestructive: isDestructive,
            // leadingIcon: leadingIcon,
            trailing: trailingIcon != null ? Icon(trailingIcon) : null,
            label: title,
            description: description,
            onSelectionChanged: (value) {
              setState(() {
                isSelected = value;
              });
            },
          ),
        )
      ]),
    );
  }
}
