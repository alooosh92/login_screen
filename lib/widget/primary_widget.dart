import 'package:flutter/material.dart';
import 'package:login_screen/main.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/screen/login_screen_d1.dart';

class PrimaryWidget extends StatefulWidget {
  final Widget widget;
  final double size;
  final String text;
  final double sizeIcon;
  const PrimaryWidget({
    super.key,
    required this.widget,
    required this.size,
    required this.text,
    required this.sizeIcon,
  });

  @override
  State<PrimaryWidget> createState() => _PrimaryWidgetState();
}

class _PrimaryWidgetState extends State<PrimaryWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'images/primarybg.png',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 2,
                right: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      StringManager.lan == "ar"
                          ? {
                              StringManager.lan = "en",
                              Navigator.of(context)
                                  .pushReplacementNamed('login'),
                            }
                          : {
                              StringManager.lan = "ar",
                              Navigator.of(context)
                                  .pushReplacementNamed('login'),
                            };
                    });
                  },
                  child: Text(
                    StringManager.selectLan[StringManager.lan],
                    style: const TextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: SizeManager.fontSize16,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: SizeManager.sizePosstion5,
                left: SizeManager.sizePosstion0,
                right: SizeManager.sizePosstion0,
                child: CircleAvatar(
                  maxRadius: widget.sizeIcon,
                  backgroundColor: ColorManager.backGroundColor,
                  child: Image.asset('images/icon.png'),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                top: MediaQuery.of(context).size.height / widget.size,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: SizeManager.paddingSize15),
                      child: Text(
                        widget.text,
                        style:
                            const TextStyle(fontSize: SizeManager.fontSize40),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: ColorManager.centerLAyar,
                            borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(SizeManager.radiusCircular40),
                            ),
                          ),
                        ),
                        widget.widget,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
