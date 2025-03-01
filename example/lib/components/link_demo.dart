import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/components/links/bp_link.dart';
import 'package:blade_design_system/components/links/link_styles.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class LinkDemo extends StatefulWidget {
  const LinkDemo({super.key});

  @override
  State<LinkDemo> createState() => _LinkDemoState();
}

class _LinkDemoState extends State<LinkDemo> {
  LinkType type = LinkType.ANCHOR;
  ButtonMood mood = ButtonMood.PRIMARY;
  LinkSize textSize = LinkSize.LARGE;
  bool isIconOnly = false;
  bool isDisabled = false;
  bool underlineLabel = false;

  final Widget icon = Icon(Icons.info_outline, color: Colors.purple[800]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mood == ButtonMood.WHITE ? Colors.blue : null,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Link Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: LinkType.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Type",
                  onSelected: (selectedVariant) {
                    setState(() {
                      type = selectedVariant ?? LinkType.ANCHOR;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: ButtonMood.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Mood",
                  onSelected: (selectedMood) {
                    setState(() {
                      mood = selectedMood ?? ButtonMood.PRIMARY;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: LinkSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText:
                      isIconOnly ? "Select Icon Size" : "Select Text Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      textSize = (selectedSize) ?? LinkSize.LARGE;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: isIconOnly,
                onChanged: (selected) {
                  setState(() {
                    isIconOnly = selected ?? false;
                  });
                },
                title: const Text("Is Icon Only?"),
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
            // New Checkbox to toggle underlineLabel property
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: underlineLabel,
                onChanged: (selected) {
                  setState(() {
                    underlineLabel = selected ?? false;
                  });
                },
                title: const Text("Underline Label?"),
              ),
            ),

            BpLink(
              size: textSize,
              label: "Link",
              mood: mood,
              icon: icon,
              isDisabled: isDisabled,
              isIconOnly: isIconOnly,
              type: type,
              onTap: () {
                print("Hello");
              },
              linkIconPosition: LinkIconPosition.LEFT,
              underlineLabel: underlineLabel,
            ),
          ],
        ),
      ),
    );
  }
}
