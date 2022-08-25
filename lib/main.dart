import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:parent_control/src/ui/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,  // Add global cupertino localiztions.
      ],
      locale: const Locale('en', 'US'),  // Current locale
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('th', 'TH'), // Thai
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}

