import 'package:flutter/material.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/FindMatch/find_match.screen.dart';

class SoloOption extends StatelessWidget {
  const SoloOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColors.background,
        surfaceTintColor: TBColors.background,
        leadingWidth: 65,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Find Match",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColors.primary,
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
                  imageAsset: 'assets/images/create-team.png',
                  onTap: () {},
                ),
                const SizedBox(height: 16.0),
                OptionCard(
                  imageAsset: 'assets/images/join-team.png',
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
