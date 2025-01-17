import 'package:flutter/material.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';

class TBChangePassword extends StatelessWidget {
  const TBChangePassword({super.key});

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
          "Change Password",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColors.primary,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your email Address Association with your account and we will send you a link to reset your password",
              softWrap: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TBTextFeild(
              hinText: "Email ",
            ),
            const SizedBox(
              height: 20,
            ),
            const TBButton(
                backgroundColor: Colors.blue, child: TBText("Continue"))
          ],
        ),
      ),
    );
  }
}
