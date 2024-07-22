// ignore_for_file: prefer_const_constructors


import 'package:chor_police/moderatorScreens/createRoom.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return HomeScreen();
    // return RoomId();
    return CreateRoom();
  }
}
