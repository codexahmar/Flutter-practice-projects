import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
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
              style: TextStyle(fontSize: 48, fontFamily: "PatrickHand"),
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 183,
                    width: 209,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 5.0,
                      ),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          "Room ID:",
                          style: TextStyle(
                              fontFamily: "PatrickHand", fontSize: 28),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "#DC123",
                              style: TextStyle(
                                  fontFamily: "PatrickHand", fontSize: 28),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.copy)
                          ],
                        )
                      ],
                    )),
                const SizedBox(height: 90,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontFamily: "PatrickHand",
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),

                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}
