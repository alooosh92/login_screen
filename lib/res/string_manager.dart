import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class StringManager {
  static String lan = "en";
  static const Map selectLan = {
    "ar": "EN",
    "en": "AR",
  };
  static const Map locale = {
    "ar": Locale("ar", "SY"),
    "en": Locale("en", "US"),
  };
  static const Map localizationsDelegates = {
    "ar": [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    "en": [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
  };

  static const Map loginButton = {
    "ar": "تسجيل الدخول",
    "en": "Login",
  };
  static const Map registerButton = {
    "ar": "تسجيل",
    "en": "Register",
  };
  static const Map newUser = {
    "ar": "أنشاء حساب جديد",
    "en": "Create New User",
  };
  static const Map username = {
    "ar": "اسم المستخدم",
    "en": "Username",
  };
  static const Map insertUsername = {
    "ar": "الرجاء إدخال اسم المستخدم",
    "en": "Plase Insert Username",
  };
  static const Map password = {
    "ar": "كلمة السر",
    "en": "PassWord",
  };
  static const Map passwordTow = {
    "ar": "تأكيد كلمة السر",
    "en": "PassWord agen",
  };
  static const Map insertPassword = {
    "ar": "الرجاء ادخال كلمة السر",
    "en": "Plase Insert Password",
  };
  static const Map insertPasswordTow = {
    "ar": "الرجاء تأكيد كلمة السر",
    "en": "Plase Insert Password agen",
  };
  static const Map forgetPassword = {
    "ar": "نسيت كلمة المرور",
    "en": "Forget Password",
  };
  static const Map remmberMe = {
    "ar": "تذكر معلوماتي",
    "en": "Remmber My",
  };
  static const Map email = {
    "ar": "البريد الإلكتروني",
    "en": "Email",
  };
  static const Map insertEmail = {
    "ar": "الرجاء إدخال الإيميل",
    "en": "Plase Insert Email",
  };
  static const Map iHaveAccont = {
    "ar": "أملك حساب بالفعل",
    "en": "I have accont",
  };
}
