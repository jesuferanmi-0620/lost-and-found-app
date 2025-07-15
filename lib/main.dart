import 'package:flutter/material.dart';
import 'package:lost_found_app/Screen/report_found_item.dart';
import 'package:lost_found_app/Screen/report_lost_item.dart';
import 'Splash_Screen/welcome_page.dart';
import '/Screen/Authentication/login.dart';
import '/Screen/Authentication/signup_screen.dart';
import '/Screen/Authentication/forgot_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Welcome',
      routes: {
        '/Welcome': (context) => const WelcomePage(),
        '/Signup_Screen': (context) => const SignupScreen(),
        '/Login': (context) => const Login(),
        '/Forgot_Password': (context) => const ForgotPasswordScreen(),
        '/Report_Lost_Screen': (context) => const  reportlostitem(),
        '/Report_Found_Screen': (context) => const reportfounditem(),
      },
    );
  }
}
