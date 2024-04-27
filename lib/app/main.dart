import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Views/Home/main.screen.dart';
import 'package:thortbal/Views/Introduction/introduction_screen.dart';
import 'package:thortbal/Views/Notification/notification.screen.dart';
import 'package:thortbal/Views/Search/search.screen.dart';

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
      title: 'TortBall App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(seedColor: TBColor.primary),
        useMaterial3: true,
      ),
      home: const TBIntroductionScreen(),
      routes: {
        "/main": (ctx) => const TBMainScreen(),
        "/search": (ctx) => const TBSearchScreen(),
        "/notification": (ctx) => const TBNotificationScreen(),
      },
    );
  }
}
