import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/var.dart';
import 'package:login_screen/widget/InputField.dart';
import 'package:login_screen/widget/SignInBtn.dart';

class RegisterInfo extends StatelessWidget {
  const RegisterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        right: 25,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: topLayer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(
              text: 'اسم المستخدم',
              hint: 'الرجاء ادخال اسم المستخدم',
              obscureTextVal: false,
              iconVal: Icons.person,
            ),
            InputField(
              text: 'البريد الالكتروني',
              hint: 'الرجاء ادخال البريد الالكتروني',
              obscureTextVal: false,
              iconVal: Icons.email,
            ),
            InputField(
              text: 'كلمة السر',
              hint: 'الرجاء ادخال كلمة السر',
              obscureTextVal: true,
              iconVal: Icons.password,
            ),
            InputField(
              text: 'تأكيد كلمة السر',
              hint: 'الرجاء تأكيد كلمة السر',
              obscureTextVal: true,
              iconVal: Icons.password,
            ),
            SizedBox(
              height: 15,
            ),
            SignInBtn(
              text: 'Register',
              function: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Divider(
                height: 1,
                color: dividerColor,
                thickness: 1,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('login');
                },
                child: Text(
                  'أملك حساب بالفعل',
                  style: GoogleFonts.arefRuqaa(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
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
