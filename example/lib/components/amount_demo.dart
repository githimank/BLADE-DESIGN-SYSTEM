import 'package:blade_design_system/components/amount/amount_enums.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:blade_design_system/components/amount/amount_widget.dart';

class AmountDemo extends StatefulWidget {
  const AmountDemo({super.key});

  @override
  State<AmountDemo> createState() => _AmountDemoState();
}

class _AmountDemoState extends State<AmountDemo> {
  AmountWeight weight = AmountWeight.SEMIBOLD;
  AmountSize size = AmountSize.XXLARGE;
  AmountType type = AmountType.HEADING;
  AmountSuffix suffix = AmountSuffix.DECIMALS;
  AmountCurrencyIndicator currencyIndicator = AmountCurrencyIndicator.SYMBOL;
  AmountCurrencyPosition currencyPosition = AmountCurrencyPosition.LEFT;
  bool isStrikethrough = false;
  bool isAffixSubtle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Button Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AmountWeight.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select weight",
                  onSelected: (selectedweight) {
                    setState(() {
                      weight = selectedweight ?? AmountWeight.SEMIBOLD;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AmountType.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Type",
                  onSelected: (selectedType) {
                    setState(() {
                      type = selectedType ?? AmountType.HEADING;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AmountSize.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Size",
                  onSelected: (selectedSize) {
                    setState(() {
                      size = selectedSize ?? AmountSize.LARGE;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AmountSuffix.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select Suffix",
                  onSelected: (selectedSuffix) {
                    setState(() {
                      suffix = selectedSuffix ?? AmountSuffix.DECIMALS;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AmountCurrencyIndicator.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select CurrencyIndicator",
                  onSelected: (selectedCurrencyIndicator) {
                    setState(() {
                      currencyIndicator = selectedCurrencyIndicator ??
                          AmountCurrencyIndicator.SYMBOL;
                    });
                  },
                ),
                Spacings.spacing3.wBox,
                DropdownMenu(
                  dropdownMenuEntries: AmountCurrencyPosition.values
                      .map((it) => DropdownMenuEntry(value: it, label: it.name))
                      .toList(),
                  width: 200,
                  hintText: "Select CurrencyPosition",
                  onSelected: (selectedCurrencyPosition) {
                    setState(() {
                      currencyPosition = selectedCurrencyPosition ??
                          AmountCurrencyPosition.LEFT;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isStrikethrough,
                onChanged: (selected) {
                  setState(() {
                    isStrikethrough = selected ?? false;
                  });
                },
                title: const Text("Is isStrikethrough?"),
              ),
            ),
            SizedBox(
              width: 250,
              child: CheckboxListTile(
                value: isAffixSubtle,
                onChanged: (selected) {
                  setState(() {
                    isAffixSubtle = selected ?? false;
                  });
                },
                title: const Text("Is isAffixSubtle?"),
              ),
            ),
            AmountWidget(
              value: 1000,
              weight: weight,
              size: size,
              type: type,
              isStrikethrough: isStrikethrough,
              isAffixSubtle: isAffixSubtle,
              suffix: suffix,
              currencyIndicator: currencyIndicator,
              currencyPosition: currencyPosition,
              // colors: colors,
            ),
          ],
        ),
      ),
    );
  }
}
