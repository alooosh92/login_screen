import 'package:flutter/material.dart';
import 'package:login_screen/var.dart';

class PrimaryWidget extends StatelessWidget {
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
                top: 5,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  maxRadius: sizeIcon,
                  backgroundColor: Color.fromARGB(0, 0, 0, 0),
                  child: Image.asset('images/icon.png'),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                top: MediaQuery.of(context).size.height / size,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: centerLAyar,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        widget,
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
