import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              const Center(
                child: Text(
                  "Chor Police",
                  style: TextStyle(fontSize: 45, fontFamily: "PatrickHand"),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Enter Your Name:",
                        style:
                            TextStyle(fontSize: 30, fontFamily: "PatrickHand"),
                      ),
                      const SizedBox(height: 34,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width:
                                    2.0, // Adjust the width to make the border bold
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width:
                                    2.0, // Adjust the width to make the border bold
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width:
                                    2.0, // Adjust the width to make the border bold
                              ),
                            ),
                            prefixIcon: const Icon(
                                Icons.person), // Add your desired icon here
                            labelText: 'Your Name',
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: "PatrickHand",
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  textStyle: const TextStyle(
                                    fontFamily: "PatrickHand",
                                  ),
                                  shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "Submit",
                                style: TextStyle(color: Colors.white,fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
