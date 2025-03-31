
import 'package:flutter/material.dart';
import 'addtocart.dart';
import 'package:final_project/detail.dart';
import 'package:flutter/material.dart';
import 'browse.dart';
import 'detail.dart';
import 'orderhistory.dart';
import 'package:final_project/welcome_screen.dart';
import 'package:final_project/invoice.dart';

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

      home: AddToCart(),


    );
  }
}
