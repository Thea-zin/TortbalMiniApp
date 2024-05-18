import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Presentations/Home/main.screen.dart';
import 'package:thortbal/Presentations/Introduction/introduction_screen.dart';
import 'package:thortbal/Presentations/Notification/notification.screen.dart';
import 'package:thortbal/Presentations/Search/search.screen.dart';
import 'package:thortbal/Presentations/Authentication/login.screen.dart';
import 'package:thortbal/app/app_main_binding.dart';

void main() {
  runApp(
    const TortBallApp(),
  );
}

class TortBallApp extends StatelessWidget {
  const TortBallApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TortBall App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(seedColor: TBColor.primary),
        useMaterial3: true,
      ),
      initialBinding: AppMainBinding(),
      home: const TBIntroductionScreen(),
      routes: {
        "/main": (ctx) => const TBMainScreen(),
        "/search": (ctx) => const TBSearchScreen(),
        "/notification": (ctx) => const TBNotificationScreen(),
        "/login": (ctx) => const TBLoginScreen(),
      },
    );
  }
}
