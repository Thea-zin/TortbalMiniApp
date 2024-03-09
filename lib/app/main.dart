import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Views/Profile/profile.screen.dart';
import 'package:thortbal/Views/authentication/login.screeen.dart';
import 'package:thortbal/Views/authentication/signUp.screen.dart';
import 'package:thortbal/Views/authentication/SigupWithEmail.screen.dart';
import 'package:thortbal/Views/authentication/login.screeen.dart';
import 'package:thortbal/Views/payment/pay_schedule.screen.dart';
import 'package:thortbal/Views/payment/booking_detail.screen.dart';
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
      home: const PaySchedule (),
    );
  }
}
