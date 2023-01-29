import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/firebase_options.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/screen/auth.dart';
import 'package:login_screen/screen/home.dart';
import 'package:login_screen/screen/login_screen_d1.dart';
import 'package:login_screen/screen/register_screen.dart';
import 'package:login_screen/var.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        'home': (context) => const Home(),
        'auth': (context) => const Auth(),
      },
      theme: ThemeData(
        fontFamily: font,
        primaryColor: ColorManager.primaryColore,
      ),
      home: const Auth(),
    );
  }
}
