import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';

import '../Views/Introduction/introduction_screen.dart';
// import 'package:thortbal/Views/Home/home.screen.dart';
// import 'package:thortbal/Views/Introduction/introduction_screen.screeen.dart';
// import 'package:thortbal/Views/authentication/login.screen.dart';
// import 'package:thortbal/Views/authentication/signUp.dart';



void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(seedColor: TBColor.primary),
        useMaterial3: true,
      ),
      home: const TBIntroductionScreen(),
    );
  }
}
