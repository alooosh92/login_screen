import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';

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
        height: SizeManager.contenerSize,
        width: SizeManager.contenerSize,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.blackColor,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeManager.radiusCircular10),
            bottomRight: Radius.circular(SizeManager.radiusCircular10),
          ),
        ),
        child: icon,
      ),
    );
  }
}
