import 'package:flutter/material.dart';
import 'package:calculator_app/components/buttons.dart';
import '../components/customTitle.dart';

class Area extends StatefulWidget {
  const Area({Key? key}) : super(key: key);

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  String userInput = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTitle(
        text: "Area",
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Padding(
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
                    Expanded(
                      child: Text(
                        userInput,
                        style: const TextStyle(fontSize: 50, color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Text("Square Meters:", style: TextStyle(fontSize: 20, color: Colors.white)),
                    Expanded(
                      child: Text(
                        result,
                        style: const TextStyle(fontSize: 50, color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Text("Square Feets:", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        text: "7",
                        onPress: () {
                          handleButtonPress("7");
                        },
                      ),
                      MyButton(
                        text: "8",
                        onPress: () {
                          handleButtonPress("8");
                        },
                      ),
                      MyButton(
                        text: "9",
                        onPress: () {
                          handleButtonPress("9");
                        },
                      ),
                      MyButton(
                        text: "AC",
                        color: const Color(0xffD4D4D2),
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                        onPress: () {
                          clearInput();
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        text: "4",
                        onPress: () {
                          handleButtonPress("4");
                        },
                      ),
                      MyButton(
                        text: "5",
                        onPress: () {
                          handleButtonPress("5");
                        },
                      ),
                      MyButton(
                        text: "6",
                        onPress: () {
                          handleButtonPress("6");
                        },
                      ),
                      MyButton(
                        text: "DEL",
                        color: const Color(0xffD4D4D2),
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                        onPress: () {
                          deleteLastCharacter();
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        text: "1",
                        onPress: () {
                          handleButtonPress("1");
                        },
                      ),
                      MyButton(
                        text: "2",
                        onPress: () {
                          handleButtonPress("2");
                        },
                      ),
                      MyButton(
                        text: "3",
                        onPress: () {
                          handleButtonPress("3");
                        },
                      ),
                      MyButton(
                        text: "C",
                        onPress: () {
                          // Replace with your logic if needed
                          handleButtonPress("C");
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        text: "0",
                        isWide: true,
                        onPress: () {
                          handleButtonPress("0");
                        },
                      ),
                      MyButton(
                        text: ".",
                        onPress: () {
                          handleButtonPress(".");
                        },
                      ),
                      MyButton(
                        text: "=",
                        color: Colors.orange,
                        onPress: () {
                          calculateArea();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff313131),
    );
  }

  void handleButtonPress(String buttonText) {
    if (buttonText == 'AC') {
      clearInput();
    } else if (buttonText == 'DEL') {
      deleteLastCharacter();
    } else if (buttonText == '=') {
      calculateArea();
    } else {
      userInput += buttonText;
      setState(() {});
    }
  }

  void clearInput() {
    userInput = '';
    result = '';
    setState(() {});
  }

  void deleteLastCharacter() {
    if (userInput.isNotEmpty) {
      userInput = userInput.substring(0, userInput.length - 1);
      setState(() {});
    }
  }

  void calculateArea() {
    double userInputValue = double.tryParse(userInput) ?? 0.0;

    double squareMeters = userInputValue * userInputValue;
    double squareFeet = squareMeters * 10.7639;

    result = '$squareMeters\n$squareFeet';

    setState(() {});
  }
}
