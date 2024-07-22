import 'package:flutter/material.dart';
import 'package:calculator_app/components/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
class CalcBtn extends StatefulWidget {
  const CalcBtn({super.key});

  @override
  State<CalcBtn> createState() => _CalcBtnState();
}

class _CalcBtnState extends State<CalcBtn> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    userInput,
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    MyButton(
                      text: "AC",
                      color: const Color(0xffD4D4D2),
                      textStyle:
                      const TextStyle(color: Colors.black, fontSize: 30),
                      onPress: () {
                        userInput = "";
                        result = "";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "+/-",
                      color: const Color(0xffD4D4D2),
                      textStyle:
                      const TextStyle(color: Colors.black, fontSize: 30),
                      onPress: () {
                        toggleSign();
                      },
                    ),
                    MyButton(
                      text: "%",
                      color: const Color(0xffD4D4D2),
                      textStyle:
                      const TextStyle(color: Colors.black, fontSize: 30),
                      onPress: () {
                        userInput += "%";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "/",
                      color: Colors.orange,
                      onPress: () {
                        userInput += "/";
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      text: "7",
                      onPress: () {
                        userInput += "7";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "8",
                      onPress: () {
                        userInput += "8";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "9",
                      onPress: () {
                        userInput += "9";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "x",
                      color: Colors.orange,
                      onPress: () {
                        userInput += "x";
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      text: "4",
                      onPress: () {
                        userInput += "4";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "5",
                      onPress: () {
                        userInput += "5";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "6",
                      onPress: () {
                        userInput += "6";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "-",
                      color: Colors.orange,
                      onPress: () {
                        userInput += "-";
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      text: "1",
                      onPress: () {
                        userInput += "1";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "2",
                      onPress: () {
                        userInput += "2";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "3",
                      onPress: () {
                        userInput += "3";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "+",
                      color: Colors.orange,
                      onPress: () {
                        userInput += "+";
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      text: "0",
                      isWide: true, // Makes the "0" button wider
                      onPress: () {
                        userInput += "0";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: ".",
                      onPress: () {
                        userInput += ".";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      text: "=",
                      color: Colors.orange,
                      onPress: () {
                        equalPress();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void toggleSign() {
    if (userInput.isNotEmpty) {
      if (userInput.startsWith('-')) {
        userInput = userInput.substring(1);
      } else {
        userInput = '-' + userInput;
      }
      setState(() {});
    }
  }

  void equalPress() {
    try {
      String finalUserInput = userInput.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(finalUserInput);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      result = eval.toString();
    } catch (e) {
      result = "Error";
    }
    setState(() {});
  }
}
