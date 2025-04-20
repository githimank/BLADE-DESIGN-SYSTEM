import 'package:blade_design_system/components/badges/bp_badges.dart';
import 'package:blade_design_system/components/card/bp_card.dart';
import 'package:blade_design_system/components/card/bp_card_footer.dart';
import 'package:blade_design_system/components/card/bp_card_header.dart';
import 'package:blade_design_system/components/card/footer_action.dart';
import 'package:blade_design_system/theme/tokens/elevations.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('CheckBox Demo'),
        ),
        body: ListView(
          children: [
            Center(
              child: BpCard(
                elevation: Elevations.highRaised,
                width: 1000,
                body: SingleChildScrollView(
                  child: Text(
                    "Create Razorpay Payments Links and share them with your customers from the Razorpay Dashboard or using APIs and start accepting payments. Check the advantages, payment methods, international currency support and more.",
                  ),
                ),
                header: BpCardHeader(
                  title: "Payment Links",
                  trailing: BpBadges(label: "UPI"),
                  leading: Icon(Icons.payments),
                  subTitle:
                      "hare payment link via an email, SMS, messenger, chatbot et",
                  // titleSuffix: BpCounter(label: 9, size: CounterSize.MEDIUM,),
                ),
                footer: BpCardFooter(
                  isActionFullWidth: true,
                  title: "Payment Pending",
                  subTitle:
                      "Please complete your pending payments as soon as possible",
                  primaryFooterAction: FooterAction(
                    text: "Primary",
                    onTap: () {},
                    accessibilityLabel: '',
                  ),
                  secondaryFooterAction: FooterAction(
                    text: "Secondary",
                    onTap: () {},
                    accessibilityLabel: '',
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
