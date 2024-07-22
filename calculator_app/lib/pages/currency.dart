import 'package:flutter/material.dart';
import 'package:calculator_app/components/buttons.dart';
import '../components/customTitle.dart';
import 'package:units_converter/units_converter.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String userInput = '';
  String result = '';
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  TextEditingController amountController = TextEditingController();

  final Map<String, double> conversionMap = {
    'EUR': 1,
    'USD': 1.2271,
    'GBP': 0.9033,
    'JPY': 126.25,
    'CNY': 7.9315,
  };

  final Map<String, String> mapSymbols = {
    'EUR': '€',
    'USD': '\$',
    'GBP': '₤',
    'JPY': '¥',
    'CNY': '¥',
  };

  late SimpleCustomProperty customConversion;

  @override
  void initState() {
    super.initState();
    customConversion = SimpleCustomProperty(conversionMap, mapSymbols: mapSymbols);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTitle(
        text: "Currency",
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: amountController,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter Amount",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    DropdownButton<String>(
                      value: fromCurrency,
                      dropdownColor: const Color(0xff313131),
                      items: conversionMap.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          fromCurrency = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      value: toCurrency,
                      dropdownColor: const Color(0xff313131),
                      items: conversionMap.keys.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          toCurrency = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      result,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
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
                          calculateConversion();
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
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
      calculateConversion();
    } else {
      userInput += buttonText;
      setState(() {});
    }
  }

  void clearInput() {
    amountController.clear();
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

  void calculateConversion() {
    double? amount = double.tryParse(amountController.text);
    if (amount != null) {
      customConversion.convert(fromCurrency, amount);
      Unit converted = customConversion.getUnit(toCurrency);
      setState(() {
        result = '${converted.stringValue} ${converted.symbol}';
      });
    }
  }
}
