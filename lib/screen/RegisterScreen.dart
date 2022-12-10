import 'package:flutter/material.dart';
import 'package:login_screen/widget/PrimaryWidget.dart';

import '../widget/LoginInfo.dart';
import '../widget/RegisterInfo.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
        widget: RegisterInfo(),
        size: 7,
        text: 'إنشاء حساب جديد',
        sizeIcon: 60,
      ),
    );
  }
}
