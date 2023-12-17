import 'package:flutter/material.dart';

import 'features/presenation/HomePage/screens/home_page.dart';


void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slash',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black45,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
          backgroundColor: Colors.black,
          elevation: 0,

        ),
      ),

      home: const MyHomePage(title: "Product details",),
    );
  }
}


