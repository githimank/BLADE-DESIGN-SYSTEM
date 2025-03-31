import 'package:blade_design_system/components/badges/bp_badges.dart';
import 'package:blade_design_system/components/bottom_sheet/bottom_sheet_extension.dart';
import 'package:blade_design_system/components/button/button_properties.dart';
import 'package:blade_design_system/components/button/button_widget.dart';
import 'package:blade_design_system/components/divider/bp_divider.dart';
import 'package:blade_design_system/components/links/bp_link.dart';
import 'package:blade_design_system/counter/bp_counter.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class BottomSheetDetails extends StatefulWidget {
  const BottomSheetDetails({super.key});

  @override
  State<BottomSheetDetails> createState() => _BottomSheetDetailsState();
}

class _BottomSheetDetailsState extends State<BottomSheetDetails> {
  bool? firstSelected;

  bool? secondSelected;

  bool? thirdSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Button Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ButtonWidget(
                  size: ButtonSize.LARGE,
                  label: "BottomSheet with footer",
                  mood: ButtonMood.INFORMATION,
                  variant: ButtonVariant.SECONDARY,
                  isFullWidth: true,
                  onTap: () {
                    context.showBpBottomSheet(
                        showHeader: false,
                        title: null,
                        initialChildSize: 0.5,
                        minChildSize: 0.5,
                        maxChildSize: 0.9,
                        snapSizes: [0.5, 0.6, 0.9],
                        // footerBuilder: (context) {
                        //   return getFooter1();
                        // },
                        contentBuilder: (context, scrollController) {
                          return Expanded(
                            child: Column(
                              children: [
                            
                                Flexible(
                                  child: ListView.builder(
                                    controller: scrollController,
                                    itemCount: 50,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text('Item #$index'),
                                      );
                                    },
                                  ),
                                ),
                                BpDivider(),
                                getFooter1(),
                              ],
                            ),
                          );
                        });
                  },
                ),
                Spacings.spacing3.hBox,
                ButtonWidget(
                  size: ButtonSize.LARGE,
                  label: "BottomSheet with Header",
                  mood: ButtonMood.INFORMATION,
                  variant: ButtonVariant.SECONDARY,
                  isFullWidth: true,
                  onTap: () {
                    context.showBpBottomSheet(
                        showHeader: true,
                        title: "My Header",
                        subTitle:
                            "Very long sub title to test the content. It should be very long for mobile as well",
                        initialChildSize: 0.5,
                        minChildSize: 0.5,
                        maxChildSize: 0.9,
                        showBackButton: false,
                        trailingLink: BpLink(label: 'Link',onTap: (){
                        Navigator.pop(context);
                        },),
                        snap: true,
                        snapSizes: [0.5, 0.6, 0.9],
                        titleSuffix: const BpCounter(label: 8),
                        footerBuilder: (context) {
                          return getFooter1();
                        },
                        contentBuilder: (context, scrollController) {
                          return Flexible(
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('Item #$index'),
                                );
                              },
                            ),
                          );
                        });
                  },
                ),
                Spacings.spacing3.hBox,
                ButtonWidget(
                  size: ButtonSize.LARGE,
                  label: "BottomSheet with Custom Header",
                  mood: ButtonMood.INFORMATION,
                  variant: ButtonVariant.SECONDARY,
                  isFullWidth: true,
                  onTap: () {
                    context.showBpBottomSheet(
                        showHeader: true,
                        title: "My Header",
                        subTitle:
                            "Very long sub title to test the content. It should be very long for mobile as well",
                        initialChildSize: 0.5,
                        minChildSize: 0.5,
                        maxChildSize: 0.9,
                        showBackButton: true,
                        snapSizes: [0.5, 0.6, 0.9],
                        titleSuffix: const BpCounter(label: 8),
                        headerBuilder: (context) => getCustomHeader(),
                        contentBuilder: (context, scrollController) {
                          return getLongScrollableTextContent(scrollController);
                        });
                  },
                ),
                Spacings.spacing3.hBox,
                ButtonWidget(
                  size: ButtonSize.LARGE,
                  label: "BottomSheet Without Snapping behaviour",
                  mood: ButtonMood.INFORMATION,
                  variant: ButtonVariant.SECONDARY,
                  isFullWidth: true,
                  onTap: () {
                    context.showBpBottomSheet(
                        showHeader: true,
                        title: "My Header",
                        subTitle:
                            "Very long sub title to test the content. It should be very long for mobile as well",
                        initialChildSize: 0.9,
                        showBackButton: true,
                        snap: false,
                        titleSuffix: const BpCounter(label: 8),
                        headerBuilder: (context) => getCustomHeader(),
                        contentBuilder: (context, scrollController) {
                          return getLongScrollableTextContent(scrollController);
                        });
                  },
                ),
                Spacings.spacing3.hBox,
                ButtonWidget(
                  size: ButtonSize.LARGE,
                  label: "BottomSheet without scroll",
                  mood: ButtonMood.INFORMATION,
                  variant: ButtonVariant.SECONDARY,
                  isFullWidth: true,
                  onTap: () {
                    context.showBpBottomSheet(
                        showHeader: true,
                        title: "My Header",
                        subTitle:
                            "Very long sub title to test the content. It should be very long for mobile as well",
                        showBackButton: true,
                        snap: false,
                        maxChildSize: 0.3,
                        minChildSize: 0.0,
                        initialChildSize: 0.3,
                        // snapSizes: [0.3],
                        titleSuffix: const BpCounter(label: 8),
                        headerBuilder: (context) => getCustomHeader(),
                        contentBuilder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  tristate: true,
                                  title: const Text("Select Option 1"),
                                  value: firstSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      firstSelected = val;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  tristate: true,
                                  title: const Text("Select Option 2"),
                                  value: secondSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      secondSelected = val;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  tristate: true,
                                  title: const Text("Select Option 3"),
                                  value: thirdSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      thirdSelected = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container getCustomHeader() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "My custom Header",
                style: context.appTypography.bodyLarge.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const BpBadges(
              size: BadgeSize.LARGE,
              label: "1 user failed",
              mood: BadgeMood.NEGATIVE,
            ),
          ],
        ),
      ),
    );
  }

  Widget getLongScrollableTextContent(ScrollController scrollController) {
    // builder(context),
    return Flexible(
      child: SingleChildScrollView(
        controller: scrollController,
        child: const IgnorePointer(child: Text('''
                      SnapPoint Behaviour
    By default BottomSheet's SnapPoints are
    [35%, 50%, 85%]
    Below is the behaviour BottomSheet follows to inteligently open the content at the optimal SnapPoint initially
    At SnapPoint 1: 35% Screen Height
    If content height is less than 35% of screen height - then bottom sheet takes the height of the content.
    If content height is >35% screen height (and <50% of screen’s height) - then bottom sheet’s initial snap point should be 35%.
    Bottom sheet will extend till the height of the content on upwards drag.
    At SnapPoint 2: 50% Screen Height
    If content height >35% but <50% screen height - the bottom sheet extends till the height of the content.
    If content height >50% (but <85% screen height) then bottom sheet’s initial snap point should be at 50% screen height.
    The bottom sheet extends till the height of the content on upwards drag.
    At SnapPoint 3: 85% Screen Height
    If content height >50% but <85% screen height - the bottom sheet extends till the height of the content.
    Bottom Sheet’s height can extend maximum until 85% screen size.
    If content height >85% of screen height then bottom sheet’s initial snap point should be at 85% of screen height.
    On further scroll or drag, contents scrolls internally.
    Checkout the
    design guideline
     here for more details
     SnapPoint Behaviour
    By default BottomSheet's SnapPoints are
    [35%, 50%, 85%]
    Below is the behaviour BottomSheet follows to inteligently open the content at the optimal SnapPoint initially
    At SnapPoint 1: 35% Screen Height
    If content height is less than 35% of screen height - then bottom sheet takes the height of the content.
    If content height is >35% screen height (and <50% of screen’s height) - then bottom sheet’s initial snap point should be 35%.
    Bottom sheet will extend till the height of the content on upwards drag.
    At SnapPoint 2: 50% Screen Height
    If content height >35% but <50% screen height - the bottom sheet extends till the height of the content.
    If content height >50% (but <85% screen height) then bottom sheet’s initial snap point should be at 50% screen height.
    The bottom sheet extends till the height of the content on upwards drag.
    At SnapPoint 3: 85% Screen Height
    If content height >50% but <85% screen height - the bottom sheet extends till the height of the content.
    Bottom Sheet’s height can extend maximum until 85% screen size.
    If content height >85% of screen height then bottom sheet’s initial snap point should be at 85% of screen height.
    On further scroll or drag, contents scrolls internally.
    Checkout the
    design guideline
     here for more details
     SnapPoint Behaviour
    By default BottomSheet's SnapPoints are
    [35%, 50%, 85%]
    Below is the behaviour BottomSheet follows to inteligently open the content at the optimal SnapPoint initially
    At SnapPoint 1: 35% Screen Height
    If content height is less than 35% of screen height - then bottom sheet takes the height of the content.
    If content height is >35% screen height (and <50% of screen’s height) - then bottom sheet’s initial snap point should be 35%.
    Bottom sheet will extend till the height of the content on upwards drag.
    At SnapPoint 2: 50% Screen Height
    If content height >35% but <50% screen height - the bottom sheet extends till the height of the content.
    If content height >50% (but <85% screen height) then bottom sheet’s initial snap point should be at 50% screen height.
    The bottom sheet extends till the height of the content on upwards drag.
    At SnapPoint 3: 85% Screen Height
    If content height >50% but <85% screen height - the bottom sheet extends till the height of the content.
    Bottom Sheet’s height can extend maximum until 85% screen size.
    If content height >85% of screen height then bottom sheet’s initial snap point should be at 85% of screen height.
    On further scroll or drag, contents scrolls internally.
    Checkout the
    design guideline
     here for more details
                      ''')),
      ),
    );
  }

  Container getFooter1() {
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ButtonWidget(
              size: ButtonSize.LARGE,
              label: "Submit",
              mood: ButtonMood.PRIMARY,
              isFullWidth: true,
              variant: ButtonVariant.SECONDARY,
            ),
            SizedBox(
              height: 8,
            ),
            ButtonWidget(
              size: ButtonSize.LARGE,
              label: "Submit",
              mood: ButtonMood.PRIMARY,
              isFullWidth: true,
              variant: ButtonVariant.PRIMARY,
            ),
          ],
        ),
      ),
    );
  }
}
