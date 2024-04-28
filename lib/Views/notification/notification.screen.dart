
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBNoficationScreen extends StatelessWidget {
  const TBNoficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColor.background,
        surfaceTintColor: TBColor.background,
        leadingWidth: 65,
        toolbarHeight: 80,
        title: TBText(
          "Notification",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      body:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today"),
              Text("MArk As All Read",
               style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: TBColor.primary,

               ),),
            ],
          )
      ],),
    );
  }
}