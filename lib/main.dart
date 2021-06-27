import 'package:flutter/material.dart';
import 'package:numbers_facts/themes/theme.dart';
import 'main_page.dart';
import 'injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(NumbersFacts());
}

class NumbersFacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeManager.getThemes(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
  localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
      localeListResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.first.languageCode &&
              supportedLocale.countryCode == locale?.first.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: MainPage().renderPage(),
    );
  }
}
