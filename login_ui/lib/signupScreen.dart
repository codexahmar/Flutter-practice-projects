import 'package:flutter/material.dart';
import 'package:login_ui/homeScreen.dart';
import 'package:login_ui/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 50,
                    width: 50,
                    image: AssetImage("images/logo.png")),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maintenance",
                      style:
                          TextStyle(fontFamily: "Rubik Medium", fontSize: 24),
                    ),
                    Text(
                      "Box",
                      style: TextStyle(
                          fontFamily: "Rubik Medium",
                          fontSize: 24,
                          color: Color(0xffF9703b)),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 24, fontFamily: "Rubik Medium"),
            )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Name",
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.phone),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock_open),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xfffe4e7eb)),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xffF9703b),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Rubik Regular",
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Already have an account?",
                      style:
                          TextStyle(fontSize: 16, fontFamily: "Rubik Regular")),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik Medium",
                          color: Color(0xffF9703B)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
