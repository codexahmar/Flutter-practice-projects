import 'dart:async';

import 'package:chap9/home_screen.dart';
import 'package:chap9/login_screen.dart';
import 'package:chap9/pages/admin_screen.dart';
import 'package:chap9/pages/student_screen.dart';
import 'package:chap9/pages/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    String userType = sp.getString("userType") ?? "";
    if (isLogin) {
      if (userType == "student") {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      } else if (userType == "admin") {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AdminScreen()));
        });
      } else if (userType == "teacher") {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TeacherScreen()));
        });
      } else {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Screen"),
        backgroundColor: Colors.blue,
      ),
      body: const Image(
        height: double.infinity,
        fit: BoxFit.fill,
        image: NetworkImage(
            "https://images.pexels.com/photos/26547171/pexels-photo-26547171/free-photo-of-canadian-goose-by-the-lake.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load"),
      ),
    );
  }
}
