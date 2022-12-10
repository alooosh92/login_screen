import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/var.dart';
import 'ConactionMethod.dart';
import 'InputField.dart';
import 'SignInBtn.dart';

class LoginInfo extends StatefulWidget {
  const LoginInfo({super.key});

  @override
  State<LoginInfo> createState() => _LoginInfoState();
}

class _LoginInfoState extends State<LoginInfo> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        right: 25,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: topLayer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Input username and password
            InputField(
              text: 'اسم المستخدم',
              hint: 'الرجاء ادخال اسم المستخدم',
              obscureTextVal: false,
              iconVal: Icons.person,
            ),
            InputField(
              text: 'كلمة السر',
              hint: 'الرجاء ادخال كلمة السر',
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
                    'نسيت كلمة المرور',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
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
                    Text('تذكر معلوماتي'),
                  ],
                ),
                SignInBtn(
                  text: 'Sign in',
                  function: () async {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('register');
                },
                child: Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            //Line
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
            //Conaction method
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 40,
                right: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConactionMethod(
                    function: () {},
                    icon: Icon(Icons.facebook),
                  ),
                  ConactionMethod(
                    function: () {},
                    icon: Icon(Icons.mail),
                  ),
                  ConactionMethod(
                    function: () {},
                    icon: Icon(Icons.phone),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
