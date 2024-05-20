import 'package:flutter/material.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';

class TBNotificationScreen extends StatelessWidget {
  const TBNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColors.background,
        surfaceTintColor: TBColors.background,
        leadingWidth: 65,
        toolbarHeight: 80,
        title: TBText(
          "Notification",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColors.primary,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today"),
              Text(
                "Mark as all read",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: TBColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
