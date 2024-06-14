import 'package:get/route_manager.dart';
import 'package:thortbal/Presentations/Authentication/login/login.binding.dart';
import 'package:thortbal/Presentations/Authentication/login/login.screen.dart';
import 'package:thortbal/Presentations/Authentication/verifyOTP.screen.dart';
import 'package:thortbal/Presentations/Home/main.screen.dart';

class AppRoutes {
  static const String main = "/main";
  static const String notification = "/notification";
  static const String search = "/search";
  static const String login = "/login";
  static const String otp = "/otp";


  static List<GetPage> pages = [
    GetPage(
      name: main,
      page: () => const TBMainScreen(),
    ),
    GetPage(
      name: login,
      page: () => const TBLoginScreen(),
      binding: TBLoginBinding(),
    ),
     GetPage(
      name: otp,
      page: () => const TBVerifyOTP(),
      binding: TBLoginBinding(),
    ),
    
  ];
}
