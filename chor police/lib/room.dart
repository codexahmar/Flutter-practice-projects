import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomId extends StatefulWidget {
  const RoomId({super.key});

  @override
  State<RoomId> createState() => _RoomIdState();
}

class _RoomIdState extends State<RoomId> {
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
              "Chor police",
              style: TextStyle(fontSize: 48, fontFamily: "PatrickHand"),
            )),
            const SizedBox(
              height: 190,
            ),
            Column(
              children: [
                const Text(
                  "Create or Join Room",
                  style: TextStyle(fontFamily: "PatrickHand", fontSize: 28),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2)),
                        prefixIcon: const Icon(Icons.key),
                        labelText: "Room ID",
                        labelStyle: const TextStyle(
                          fontFamily: "PatrickHand",
                          fontSize: 18,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Join Room",
                        style: TextStyle(
                            fontFamily: "PatrickHand",
                            color: Colors.black,
                            fontSize: 22),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "OR",
                  style: TextStyle(fontFamily: "PatrickHand", fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Create Room,",
                        style: TextStyle(
                            fontFamily: "PatrickHand",
                            color: Colors.black,
                            fontSize: 22),
                      ),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
