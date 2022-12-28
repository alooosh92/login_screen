import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';

class SignInBtn extends StatelessWidget {
  final Function() function;
  final String text;
  const SignInBtn({Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: SizeManager.contenerSize40,
        width: SizeManager.contenerSize90,
        decoration: const BoxDecoration(
          color: ColorManager.primaryColore,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeManager.radiusCircular15),
            bottomRight: Radius.circular(SizeManager.radiusCircular15),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: SizeManager.fontSize16,
              color: ColorManager.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
