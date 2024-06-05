import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Presentations/Authentication/login/login.screen.dart';
import 'package:thortbal/core/services/tb_routes.dart';
import 'package:thortbal/presentations/Home/main.screen.dart';
import 'package:thortbal/presentations/Introduction/introduction_screen.dart';
import 'package:thortbal/presentations/Notification/notification.screen.dart';
import 'package:thortbal/presentations/Search/search.screen.dart';

import 'package:thortbal/app/app_main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const TortBallApp(),
  );
}

class TortBallApp extends StatelessWidget {
  const TortBallApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TortBall App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(seedColor: TBColors.primary),
        useMaterial3: true,
      ),
      initialBinding: AppMainBinding(),
      home: const TBIntroductionScreen(),
      getPages: AppRoutes.pages,
      routes: {
        "/main": (ctx) => const TBMainScreen(),
        "/search": (ctx) => const TBSearchScreen(),
        "/notification": (ctx) => const TBNotificationScreen(),
        "/login": (ctx) => const TBLoginScreen(),
      },
    );
  }
}
