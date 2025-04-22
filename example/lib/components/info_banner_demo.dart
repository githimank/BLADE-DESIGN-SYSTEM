import 'package:blade_design_system/components/info_bar/bp_custom_info_bar.dart';
import 'package:blade_design_system/components/info_bar/bp_info_bar.dart';
import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

class InfoBannerDemo extends StatelessWidget {
  const InfoBannerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Snack Bar Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BpCustomInfoBar( status: "Your application is Under Review. If you have any questions feel free to reach out to us at support@bellpost.com OR +91-9242012345."),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: ElevatedButton(
                onPressed: (){
                  BpInfoBar.show(context, status: "Your application is Under Review. If you have any questions feel free to reach out to us at support@bellpost.com OR +91-9242012345.");
                },
                child: const Text('Show Overlay Banner'),
              ),
            ),
            Spacings.spacing7.hBox,
            const Text("AppBar Height: $kToolbarHeight"),
          ],
        ),
      ),
    );
  }
}
