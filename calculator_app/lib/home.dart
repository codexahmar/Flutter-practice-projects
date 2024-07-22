import 'package:flutter/material.dart';
import 'package:calculator_app/components/CalcBtn.dart';
import 'package:calculator_app/components/customTitle.dart';
import 'package:calculator_app/components/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomTitle(
        text: "Standard",
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the menu icon
          size: 30, // Change the size of the menu icon
        ),
      ),
      body: CalcBtn(),
      backgroundColor: Color(0xff313131),
      drawer: Menu(),
    );
  }
}
