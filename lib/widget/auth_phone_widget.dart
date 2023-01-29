import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/screen/home.dart';
import 'package:login_screen/var.dart';
import 'package:login_screen/widget/all_conaction_method.dart';
import 'conaction_method.dart';
import 'input_field.dart';
import 'sign_in_btn.dart';

class AuthPhoneInfo extends StatefulWidget {
  const AuthPhoneInfo({super.key});

  @override
  State<AuthPhoneInfo> createState() => _AuthPhoneInfoState();
}

class _AuthPhoneInfoState extends State<AuthPhoneInfo> {
  bool ischecked = false;
  TextEditingController authControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return Home();
        else {
          return Container(
            margin: const EdgeInsets.only(
              top: SizeManager.contenerMargin25,
              right: SizeManager.contenerMargin25,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: ColorManager.topLayer,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(SizeManager.radiusCircular40),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(SizeManager.contenerMargin35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Input username and password
                  InputField(
                    controller: authControlle,
                    text: StringManager.authCode[StringManager.lan],
                    hint: StringManager.authCode[StringManager.lan],
                    obscureTextVal: false,
                    iconVal: Icons.person,
                  ),

                  const SizedBox(
                    height: SizeManager.sizeBoxHighte25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SignInBtn(
                        text: StringManager.loginButton[StringManager.lan],
                        function: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: DDverificationId,
                                  smsCode: authControlle.text.trim());
                          await FirebaseAuth.instance
                              .signInWithCredential(credential);
                          Navigator.of(context).pushReplacementNamed('auth');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizeManager.sizeBoxHighte25,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('register');
                      },
                      child: Text(
                        StringManager.newUser[StringManager.lan],
                        style: const TextStyle(
                          color: ColorManager.blackColor,
                          fontSize: SizeManager.fontSize14,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  //Line
                  const Padding(
                    padding: EdgeInsets.only(
                      left: SizeManager.paddingSize40,
                      right: SizeManager.paddingSize40,
                    ),
                    child: Divider(
                      height: SizeManager.divider,
                      color: ColorManager.dividerColor,
                      thickness: SizeManager.divider,
                    ),
                  ),
                  //Conaction method
                  const AllConactionMethod(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
