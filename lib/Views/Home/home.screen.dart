import "package:flutter/material.dart" hide ModalBottomSheetRoute;
import "package:flutter/services.dart";
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import "package:thortbal/Constants/tb_image.dart";
import "package:thortbal/Views/FindMatch/find_match.screen.dart";

class TBHomeScreen extends StatefulWidget {
  const TBHomeScreen({super.key});

  @override
  State<TBHomeScreen> createState() => _TBHomeScreenState();
}

class _TBHomeScreenState extends State<TBHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              TBImages.tbLogo,
              height: 140,
              width: 140,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              'Ready to Play?',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Find Your Match & Hit The Field',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () => _showModalBottomSheet(context: context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
              ),
              child: const Text('Find Match'),
            ),
          ),
          Expanded(
            child: Image.asset(
              TBImages.tbHome,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet({required BuildContext context}) {
    showCupertinoModalBottomSheet(
        overlayStyle: SystemUiOverlayStyle.light,
        barrierColor: Colors.black45,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (context) {
          return const TBFindMatchScreen();
        });
  }
}
