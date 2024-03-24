import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_image.dart';
import 'package:thortbal/Views/FindMatch/find_match.screen.dart';

class SoloOption extends StatelessWidget {
  const SoloOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOLO'),
        centerTitle: true,
        backgroundColor: TBColor.primary,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Choose your preferences',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                OptionCard(
                  imageAsset: TBImages.tbCreateTeam,
                  onTap: () {},
                ),
                const SizedBox(height: 16.0),
                OptionCard(
                  imageAsset: TBImages.tbJoinTeam,
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
