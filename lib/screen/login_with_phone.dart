import 'package:flutter/material.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/widget/login_phone_widget.dart';
import 'package:login_screen/widget/primary_widget.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection:
            StringManager.lan == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: PrimaryWidget(
          widget: const LoginPhoneInfo(),
          size: SizeManager.sizeScreenLogin,
          text: StringManager.loginButton[StringManager.lan],
          sizeIcon: SizeManager.sizeIconLogin,
        ),
      ),
    );
  }
}
