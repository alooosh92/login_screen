import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/var.dart';

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
          style: TextStyle(fontSize: 25),
        ),
        TextFormField(
          obscureText: obscureTextVal,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColore),
            ),
            hintText: hint,
            suffixIcon: Icon(
              color: primaryColore,
              iconVal,
            ),
          ),
        ),
      ],
    );
  }
}
