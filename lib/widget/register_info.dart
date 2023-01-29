import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/res/color_manager.dart';
import 'package:login_screen/res/size_manager.dart';
import 'package:login_screen/res/string_manager.dart';
import 'package:login_screen/widget/input_field.dart';
import 'package:login_screen/widget/sign_in_btn.dart';

class RegisterInfo extends StatelessWidget {
  const RegisterInfo({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameControlle = TextEditingController();
    TextEditingController passwordControlle = TextEditingController();
    TextEditingController emailControlle = TextEditingController();
    TextEditingController password2Controlle = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(
        top: SizeManager.contenerMargin25,
        right: SizeManager.contenerMargin25,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: ColorManager.topLayer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeManager.radiusCircular40),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(SizeManager.contenerMargin20),
        child: Column(
          children: [
            InputField(
              controller: emailControlle,
              text: StringManager.email[StringManager.lan],
              hint: StringManager.insertEmail[StringManager.lan],
              obscureTextVal: false,
              iconVal: Icons.email,
            ),
            InputField(
              controller: passwordControlle,
              text: StringManager.password[StringManager.lan],
              hint: StringManager.insertPassword[StringManager.lan],
              obscureTextVal: true,
              iconVal: Icons.password,
            ),
            InputField(
              controller: password2Controlle,
              text: StringManager.passwordTow[StringManager.lan],
              hint: StringManager.insertPasswordTow[StringManager.lan],
              obscureTextVal: true,
              iconVal: Icons.password,
            ),
            const SizedBox(
              height: SizeManager.sizeBoxHighte15,
            ),
            SignInBtn(
              text: StringManager.registerButton[StringManager.lan],
              function: () async {
                if (passwordControlle.text.trim() ==
                    password2Controlle.text.trim()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  try {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailControlle.text.trim(),
                            password: passwordControlle.text.trim())
                        .then((value) => Navigator.of(context).pop())
                        .whenComplete(
                          () => Navigator.of(context)
                              .pushReplacementNamed('auth'),
                        );
                  } catch (_) {
                    usernameControlle.text = _.toString();
                    rethrow;
                  }
                }
              },
            ),
            const SizedBox(
              height: SizeManager.sizeBoxHighte15,
            ),
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
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('login');
                },
                child: Text(
                  StringManager.iHaveAccont[StringManager.lan],
                  style: GoogleFonts.arefRuqaa(
                    textStyle: const TextStyle(
                      color: ColorManager.blackColor,
                      fontSize: SizeManager.fontSize14,
                    ),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
