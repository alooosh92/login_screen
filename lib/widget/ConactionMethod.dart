import 'package:flutter/material.dart';

class ConactionMethod extends StatelessWidget {
  final Function() function;
  final Widget icon;
  const ConactionMethod({Key? key, required this.function, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: icon,
      ),
    );
  }
}
