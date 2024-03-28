// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore


import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
void main() {
   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: LoginScreen(),
         );
  }
}

