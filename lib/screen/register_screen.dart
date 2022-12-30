import 'package:flutter/material.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/widget/primary_widget.dart';
import '../widget/register_info.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection:
            StringManager.lan == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: PrimaryWidget(
          widget: const RegisterInfo(),
          size: SizeManager.sizeScreenRegister,
          text: StringManager.newUser[StringManager.lan],
          sizeIcon: SizeManager.sizeIconRegister,
        ),
      ),
    );
  }
}
