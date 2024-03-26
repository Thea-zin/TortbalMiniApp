import "package:flutter/material.dart";
import "package:thortbal/Constants/tb_image.dart";
import "package:thortbal/Helpers/Widgets/utils/tb_global_funs.dart";
import "package:thortbal/Views/FindMatch/find_match.screen.dart";

class TBHomeScreen extends StatefulWidget {
  const TBHomeScreen({super.key});

  @override
  State<TBHomeScreen> createState() => _TBHomeScreenState();
}

class _TBHomeScreenState extends State<TBHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
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
      ),
    );
  }

  void _showModalBottomSheet({required BuildContext context}) {
    showTBBottomSheet(context: context, child: const TBFindMatchScreen());
  }
}
