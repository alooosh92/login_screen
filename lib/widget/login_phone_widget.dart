import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/screen/home.dart';
import 'package:login_screen/var.dart';
import 'conaction_method.dart';
import 'input_field.dart';
import 'sign_in_btn.dart';

class LoginPhoneInfo extends StatefulWidget {
  const LoginPhoneInfo({super.key});

  @override
  State<LoginPhoneInfo> createState() => _LoginPhoneInfoState();
}

class _LoginPhoneInfoState extends State<LoginPhoneInfo> {
  bool ischecked = false;
  TextEditingController usernameControlle = TextEditingController();
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
                    controller: usernameControlle,
                    text: StringManager.phonNumber[StringManager.lan],
                    hint: StringManager.phonNumber[StringManager.lan],
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

                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: usernameControlle.text.trim(),
                            verificationCompleted: (phoneAuthCredential) {
                              Navigator.of(context)
                                  .pushReplacementNamed('auth');
                            },
                            verificationFailed: (error) {
                              Navigator.of(context).pop();
                            },
                            codeSent:
                                (verificationId, forceResendingToken) async {
                              DDverificationId = verificationId;
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamed('authphone');
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                          );
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
                  Padding(
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
                          function: () {},
                          icon: const Icon(Icons.mail),
                        ),
                        ConactionMethod(
                          function: () {},
                          icon: const Icon(Icons.phone),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
