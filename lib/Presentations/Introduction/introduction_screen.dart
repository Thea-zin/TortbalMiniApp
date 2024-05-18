import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/core/resource/tb_images.dart';
import 'package:thortbal/core/utils/tb_global_funs.dart';
import 'package:thortbal/presentations/Authentication/signUp.screen.dart';

class TBIntroductionScreen extends StatefulWidget {
  const TBIntroductionScreen({Key? key}) : super(key: key);

  @override
  State<TBIntroductionScreen> createState() => _TBIntroductionScreenState();
}

class _TBIntroductionScreenState extends State<TBIntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    // Define your pages
    List<PageViewModel> pages = [
      PageViewModel(
        title: "",

        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              TBImages.logo,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              TBImages.introScreen1,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'BOOKING',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize:
                    TBTextSize.xlarge, // Using xlarge from TBTextSize class
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Tortbal allows users to book slots through our platform allocated in Phnom Penh.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize:
                      TBTextSize.medium, // Using large from TBTextSize class
                ))
          ],
        ),

        // Add other properties as needed
      ),
      PageViewModel(
        title: "",
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              TBImages.logo,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              TBImages.introScreen2,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'MATCHING',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: TBTextSize.xlarge),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'We enables pitch owners to effortlessly organize matches by providing a function that could match team and team through our platform.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize:
                      TBTextSize.medium, // Using large from TBTextSize class
                ))
          ],
        ),
        // Add other properties as needed
      ),
      PageViewModel(
        title: "",
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              TBImages.logo,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              TBImages.introScreen3,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Text('GAMIFICATION',
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: TBTextSize.xlarge)),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Our system will record each team  match results after the match that allow you to track your team performance and compete with other teams.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize:
                    TBTextSize.medium, // Using large from TBTextSize class
              ),
            )
          ],
        ),
      )
      // Add more pages if needed
    ];

    return IntroductionScreen(
      pages: pages,

      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      next: const Icon(Icons.arrow_forward), // Setting a next button icon
      done: const Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      skip: const Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      onDone: () {
        showTBBottomSheet(context: context, child: const TBSignupNumberphone());
      },
    );
  }
}
