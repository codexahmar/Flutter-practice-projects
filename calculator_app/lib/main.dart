import 'package:calculator_app/pages/area.dart';
import 'package:calculator_app/pages/currency.dart';
import 'package:calculator_app/pages/data.dart';

import 'package:flutter/material.dart';
import 'package:calculator_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/", // Optionally set initial route
      routes: {
        "/": (context) => const Home(),
        "/currencyCalc": (context) => const Currency(),
        "/areaCalc": (context) => const Area(),
        "/dataCalc": (context) => const Data(),
      },
    );
  }
}
