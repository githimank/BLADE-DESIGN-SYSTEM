import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/components/button/button_widget.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class ButtonDetails extends StatefulWidget {
  const ButtonDetails({super.key});

  @override
  State<ButtonDetails> createState() => _ButtonDetailsState();
}

class _ButtonDetailsState extends State<ButtonDetails> {
  ButtonVariant variant = ButtonVariant.PRIMARY;
  ButtonMood mood = ButtonMood.PRIMARY;
  ButtonSize size = ButtonSize.LARGE;
  bool isFullWidth = false;
  bool isIconOnly = false;
  bool isLoading = false;
  bool isDisabled = false;
  bool showTrailingIcon = false;
  bool showLeadingIcon = false;

  final Widget icon = const Icon(Icons.health_and_safety_rounded);
  final Widget trailing = const Icon(Icons.arrow_forward_rounded);
  final Widget leading = const Icon(Icons.arrow_back);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mood == ButtonMood.WHITE ? Colors.blue : null,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Button Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: ButtonVariant.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Variant",
                  onSelected: (selectedVariant) {
                    setState(() {
                      variant = selectedVariant ?? ButtonVariant.PRIMARY;
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
                  dropdownMenuEntries: ButtonSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize ?? ButtonSize.LARGE;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: isFullWidth,
                onChanged: (selected) {
                  setState(() {
                    isFullWidth = selected ?? false;
                  });
                },
                title: const Text("Is Full Width?"),
              ),
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
                value: isLoading,
                onChanged: (selected) {
                  setState(() {
                    isLoading = selected ?? false;
                  });
                },
                title: const Text("Is Loading?"),
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
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                value: showTrailingIcon,
                onChanged: (selected) {
                  setState(() {
                    showTrailingIcon = selected ?? false;
                  });
                },
                title: const Text("show trailing icon?"),
              ),
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
            ButtonWidget(
              size: size,
              label: "Button",
              mood: mood,
              variant: variant,
              isFullWidth: isFullWidth,
              isLoading: isLoading,
              leading: showLeadingIcon ? leading : null,
              trailing: showTrailingIcon ? trailing : null,
              icon: isIconOnly ? icon : null,
              isDisabled: isDisabled,
              isIconOnly: isIconOnly,
              onTap: () {
                // context.showBpBottomSheet(
                //     showHeader: false,
                //     title: null,
                //     initialChildSize: 0.3,
                //     minChildSize: 0.3,
                //     maxChildSize: 0.8,
                //     snapSizes: [0.3, 0.5, 0.8],
                //     footerBuilder: (context) {
                //       return Container(
                //         color: Colors.white,
                //         child: const Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: Column(
                //             children: [
                //               BpButton(
                //                 size: ButtonSize.LARGE,
                //                 label: "Submit",
                //                 mood: ButtonMood.PRIMARY,
                //                 isFullWidth: true,
                //                 variant: ButtonVariant.SECONDARY,
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               BpButton(
                //                 size: ButtonSize.LARGE,
                //                 label: "Submit",
                //                 mood: ButtonMood.PRIMARY,
                //                 isFullWidth: true,
                //                 variant: ButtonVariant.PRIMARY,
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     contentBuilder: (context, scrollController) {
                //       return Flexible(
                //         child: ListView.builder(
                //           controller: scrollController,
                //           itemCount: 50,
                //           itemBuilder: (context, index) {
                //             return ListTile(
                //               title: Text('Item #$index'),
                //             );
                //           },
                //         ),
                //       );
                //     });
              },
            ),
          ],
        ),
      ),
    );
  }
}
