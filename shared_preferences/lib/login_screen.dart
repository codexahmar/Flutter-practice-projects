
import 'package:chap9/pages/admin_screen.dart';
import 'package:chap9/pages/student_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Age",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("email", emailController.text.toString());
                sp.setString("password", passwordController.text.toString());
                sp.setString("age", ageController.text.toString());
                sp.setString("userType", "student");
                sp.setBool("isLogin", true);

                if(sp.getString("userType")=="admin"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (const AdminScreen())));
                }else if(sp.getString("userType")=="student"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (const StudentScreen())));
                }
                else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (const LoginScreen( ))));
                }

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: const Center(
                  child: Text("Sign Up "),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
