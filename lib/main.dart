import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/screen/LoginScreenD1.dart';
import 'package:login_screen/screen/RegisterScreen.dart';
import 'package:login_screen/var.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Arabic language code
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar", "SY")],
      locale: Locale("ar", "SY"),
      routes: {
        'register': (context) => RegisterScreen(),
        'login': (context) => LoginScreenD1(),
      },
      theme: ThemeData(
        fontFamily: font,
        primaryColor: primaryColore,
      ),
      home: LoginScreenD1(),
    );
  }
}
