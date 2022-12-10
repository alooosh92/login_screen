import 'package:flutter/material.dart';
import 'package:login_screen/var.dart';

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
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: primaryColore,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
