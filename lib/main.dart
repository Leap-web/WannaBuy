import 'package:final_project/welcome_screen.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'search.dart';
>>>>>>> 248f8a8f338dbd1e38cca3110c90b905c2a2410f

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
      home: const WelcomeScreen(),
=======
      // home: const Infocontact(contactName: "IW"), // Fix: Pass a contact name
      home: const browseitem(),
>>>>>>> 248f8a8f338dbd1e38cca3110c90b905c2a2410f
    );
  }
}
