import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';

class InputField extends StatelessWidget {
  final String text;
  final String hint;
  final bool obscureTextVal;
  final IconData iconVal;
  const InputField({
    Key? key,
    required this.text,
    required this.hint,
    required this.obscureTextVal,
    required this.iconVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: SizeManager.fontSize25),
        ),
        TextFormField(
          obscureText: obscureTextVal,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primaryColore),
            ),
            hintText: hint,
            suffixIcon: Icon(
              color: ColorManager.primaryColore,
              iconVal,
            ),
          ),
        ),
      ],
    );
  }
}
