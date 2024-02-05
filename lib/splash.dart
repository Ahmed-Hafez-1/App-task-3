import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_set.dart';
import 'package:flutter_application_1/HomePage.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_application_1/app_set.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_application_1/HomePage.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_application_1/logIn.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleLogin();
  }

  Future<void> handleLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userPhoneNumber = prefs.getString(app_set.phoneNumberSharedPrefsKey);
    if (userPhoneNumber == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage(username: '',)),
      );
    }
  }

  //
  // save data in shared
  // create splash screen
  // get data sharred prefs

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SharedPreferences {
  String? getString(String phoneNumberSharedPrefsKey) {}
  
  static getInstance() {}
}
