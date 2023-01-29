import 'package:flutter/material.dart';

import '../res/size_manager.dart';
import 'conaction_method.dart';

class AllConactionMethod extends StatelessWidget {
  const AllConactionMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SizeManager.paddingSizeTop,
        left: SizeManager.paddingSize40,
        right: SizeManager.paddingSize40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ConactionMethod(
            function: () {},
            icon: const Icon(Icons.facebook),
          ),
          ConactionMethod(
            function: () {
              Navigator.of(context).pushReplacementNamed('login');
            },
            icon: const Icon(Icons.mail),
          ),
          ConactionMethod(
            function: () {
              Navigator.of(context).pushReplacementNamed('phonelogin');
            },
            icon: const Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}
