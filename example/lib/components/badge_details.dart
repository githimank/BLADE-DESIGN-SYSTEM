import 'package:blade_design_system/components/badges/bp_badges.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BadgeDetails extends StatefulWidget {
  const BadgeDetails({super.key});

  @override
  State<BadgeDetails> createState() => _BadgeDetailsState();
}

class _BadgeDetailsState extends State<BadgeDetails> {
  BadgeEmphasis emphasis = BadgeEmphasis.INTENSE;
  BadgeMood mood = BadgeMood.PRIMARY;
  BadgeSize size = BadgeSize.LARGE;
  bool showLeadingIcon = false;

  final Widget icon = const Icon(Icons.task_alt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Badge Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: BadgeEmphasis.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Type",
                  onSelected: (selectedVariant) {
                    setState(() {
                      emphasis = selectedVariant ?? BadgeEmphasis.INTENSE;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: BadgeMood.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Mood",
                  onSelected: (selectedMood) {
                    setState(() {
                      mood = selectedMood ?? BadgeMood.PRIMARY;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: BadgeSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize ?? BadgeSize.LARGE;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: showLeadingIcon,
                onChanged: (selected) {
                  setState(() {
                    showLeadingIcon = selected ?? false;
                  });
                },
                title: const Text("Show Leading icon?"),
              ),
            ),
            BpBadges(
              size: size,
              label: "In-Progress. Head over to settlements page for more details.",
              mood: mood,
              icon: showLeadingIcon ? icon : null,
              emphasis: emphasis,
              showLeadingIcon: showLeadingIcon,
            ),
          ],
        ),
      ),
    );
  }
}
