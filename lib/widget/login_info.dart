import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/screen/home.dart';
import 'conaction_method.dart';
import 'input_field.dart';
import 'sign_in_btn.dart';

class LoginInfo extends StatefulWidget {
  const LoginInfo({super.key});

  @override
  State<LoginInfo> createState() => _LoginInfoState();
}

class _LoginInfoState extends State<LoginInfo> {
  bool ischecked = false;
  TextEditingController usernameControlle = TextEditingController();
  TextEditingController passwoedControlle = TextEditingController();
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
                    text: StringManager.username[StringManager.lan],
                    hint: StringManager.insertUsername[StringManager.lan],
                    obscureTextVal: false,
                    iconVal: Icons.person,
                  ),
                  InputField(
                    controller: passwoedControlle,
                    text: StringManager.password[StringManager.lan],
                    hint: StringManager.insertPassword[StringManager.lan],
                    obscureTextVal: true,
                    iconVal: Icons.password,
                  ),
                  //Forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          StringManager.forgetPassword[StringManager.lan],
                          style: const TextStyle(
                            color: ColorManager.blackColor,
                            fontSize: SizeManager.fontSize14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizeManager.sizeBoxHighte25,
                  ),
                  //Remmeber me
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: ischecked,
                              onChanged: (value) {
                                setState(() {
                                  ischecked = value!;
                                });
                              }),
                          Text(StringManager.remmberMe[StringManager.lan]),
                        ],
                      ),
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
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: usernameControlle.text.trim(),
                                  password: passwoedControlle.text.trim())
                              .whenComplete(
                                () => Navigator.of(context).pop(),
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
