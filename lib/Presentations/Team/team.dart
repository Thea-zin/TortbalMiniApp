import 'package:flutter/material.dart';

import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';

class Team extends StatelessWidget {
  const Team({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: 163,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                  'assets/images/team_players.png'), // Replace with your asset image
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Team Infomation
                  const TBText(
                    "Team Information",
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TBTextFeild(
                    hinText: "Enter Full Name",
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  TBTextFeild(
                    hinText: "Phone Number",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TBTextFeild(
                    hinText: "Amount Of player",
                    suffix: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TBText(
                    "Matching",
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  /// Matching
                  TBTextFeild(
                    hinText: "Type Pitch",
                    suffix: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TBTextFeild(
                    hinText: "Team level",
                    suffix: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TBButton(
                      backgroundColor: TBColors.primary,
                      child: const TBText(
                        "Find Match",
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
