import 'package:flutter/material.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/widget/auth_phone_widget.dart';
import 'package:login_screen/widget/primary_widget.dart';

class AuthPhone extends StatefulWidget {
  const AuthPhone({super.key});

  @override
  State<AuthPhone> createState() => _AuthPhoneState();
}

class _AuthPhoneState extends State<AuthPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection:
            StringManager.lan == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: PrimaryWidget(
          widget: const AuthPhoneInfo(),
          size: SizeManager.sizeScreenLogin,
          text: StringManager.loginButton[StringManager.lan],
          sizeIcon: SizeManager.sizeIconLogin,
        ),
      ),
    );
  }
}
