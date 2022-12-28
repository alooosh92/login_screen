import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/screen/login_screen_d1.dart';
import 'package:login_screen/screen/register_screen.dart';
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
      localizationsDelegates:
          StringManager.localizationsDelegates[StringManager.lan],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: StringManager.locale[StringManager.lan],
      routes: {
        'register': (context) => const RegisterScreen(),
        'login': (context) => const LoginScreenD1(),
      },
      theme: ThemeData(
        fontFamily: font,
        primaryColor: ColorManager.primaryColore,
      ),
      home: const LoginScreenD1(),
    );
  }
}
