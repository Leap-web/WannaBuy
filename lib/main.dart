<<<<<<< HEAD
import 'package:final_project/detail.dart';
import 'package:flutter/material.dart';
import 'browse.dart';
import 'detail.dart';
import 'orderhistory.dart';
=======
import 'package:final_project/welcome_screen.dart';
import 'package:flutter/material.dart';
>>>>>>> 5022e7c7d8c00c6c75b7221ca9a5aec46c91e3d3

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(103, 58, 183, 1),
        ),
        fontFamily: "Lato",
        useMaterial3: true,
      ),
<<<<<<< HEAD
      // home: const Infocontact(contactName: "IW"), // Fix: Pass a contact name
      home: const BrowseItem(),
=======
      home: const WelcomeScreen(),
      
>>>>>>> 5022e7c7d8c00c6c75b7221ca9a5aec46c91e3d3
    );
  }
}
