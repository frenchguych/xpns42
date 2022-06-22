import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpns42/misc/constants.dart';

import 'pages/home_page.dart';

class Xpns42App extends StatelessWidget {
  const Xpns42App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kPrimaryColor,
          onPrimary: kOnPrimaryColor,
          secondary: Colors.pink,
          onSecondary: Colors.green,
          background: Colors.pink,
          onBackground: Colors.green,
          error: Colors.pink,
          onError: Colors.green,
          surface: Colors.pink,
          onSurface: Colors.green,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 1,
        ),
      ),
      home: const HomePage(),
      supportedLocales: const [Locale('en'), Locale('fr')],
      localizationsDelegates: [
        GettextLocalizationsDelegate(defaultLanguage: 'fr'),
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        if (locales != null) {
          for (var locale in locales) {
            var supportedLocale = supportedLocales.where((element) =>
                element.languageCode == locale.languageCode &&
                element.countryCode == locale.countryCode);
            if (supportedLocale.isNotEmpty) {
              return supportedLocale.first;
            }
            supportedLocale = supportedLocales.where(
              (element) => element.languageCode == locale.languageCode,
            );
            if (supportedLocale.isNotEmpty) {
              return supportedLocale.first;
            }
          }
        }
        return null;
      },
    );
  }
}
