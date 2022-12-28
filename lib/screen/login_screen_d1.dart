import 'package:flutter/material.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/widget/primary_widget.dart';
import 'package:login_screen/widget/login_info.dart';

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
        widget: const LoginInfo(),
        size: SizeManager.sizeScreenLogin,
        text: StringManager.loginButton[StringManager.lan],
        sizeIcon: SizeManager.sizeIconLogin,
      ),
    );
  }
}
