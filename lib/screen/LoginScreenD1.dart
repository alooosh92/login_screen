import 'package:flutter/material.dart';
import 'package:login_screen/widget/PrimaryWidget.dart';
import 'package:login_screen/widget/LoginInfo.dart';

class LoginScreenD1 extends StatefulWidget {
  const LoginScreenD1({super.key});

  @override
  State<LoginScreenD1> createState() => _LoginScreenD1State();
}

class _LoginScreenD1State extends State<LoginScreenD1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
        widget: LoginInfo(),
        size: 4,
        text: 'تسجيل الدخول',
        sizeIcon: 85,
      ),
    );
  }
}
