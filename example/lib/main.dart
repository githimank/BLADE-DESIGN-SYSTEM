import 'package:blade_design_system/theme/blade_theme.dart';
import 'package:blade_design_system/theme/colors/light_color_theme_impl.dart';
import 'package:example/components/counter_details.dart';
import 'package:example/components/indicator_details.dart';
import 'package:flutter/material.dart';

import 'components/RadioDemo.dart';
import 'components/accordion_details.dart';
import 'components/action_list_item.dart';
import 'components/amount_demo.dart';
import 'components/badge_details.dart';
import 'components/button_details.dart';
import 'components/checkbox_demo.dart';
import 'components/chip_demo.dart';
import 'components/link_demo.dart';
import 'components/progressbar_details.dart';
import 'components/spinner_details.dart';
import 'components/tooltip_demo.dart';
import 'components_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System',
      initialRoute: '/',
      routes: {
        '/': (context) => const ComponentsScreen(),
        '/spinner': (context) => const SpinnerDetails(),
        '/checkboxDemo': (context) => const CheckboxDemo(),
        '/chipDemo': (context) => const ChipDemo(),
        '/badgeDetails': (context) => const BadgeDetails(),
        '/radioDemo': (context) => const RadioDemo(),
        '/tooltipDemo': (context) => const TooltipDemo(),
        '/amountDemo': (context) => const AmountDemo(),
        '/buttonDetails': (context) => const ButtonDetails(),
        '/buttonLink': (context) => const LinkDemo(),
        '/accordion': (context) => const AccordionDetails(),
        '/counterDetails': (context) => const CounterDetails(),
        '/progressBarDetails': (context) => const ProgressbarDetails(),
        '/indicatorDetails': (context) => const IndicatorDetails(),
        '/actionListItem': (context) => const ActionListItemDetails(),

      },
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        extensions: <ThemeExtension<dynamic>>[
          BladeTheme.appTextTheme,
          LightColorThemeImpl().colorTheme,
        ],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
