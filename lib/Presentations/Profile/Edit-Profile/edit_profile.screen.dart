import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';

class TBEditProfile extends StatefulWidget {
  const TBEditProfile({super.key});

  @override
  State<TBEditProfile> createState() => _TBEditProfileState();
}

class _TBEditProfileState extends State<TBEditProfile> {
  final double _padding = 16;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColor.background,
        leadingWidth: 65,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Profile",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      backgroundColor: TBColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Profile Image
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: TBColor.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                            onPressed: () {},
                            icon: const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.edit, size: 14),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 20),

            /// Form field
            Form(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    /// Full name
                    TBTextFeild(
                      hinText: "Enter your name",
                    ),
                    const SizedBox(height: 20),

                    /// Gender and DOB
                    Row(
                      children: [
                        TBTextFeild(
                          width: size.width * 0.5 - 25,
                          hinText: "Gender",
                          suffix: Center(
                            child: Transform.rotate(
                              angle: -pi / 2,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 18,
                                color: TBColor.primary,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        TBTextFeild(
                          hinText: "Date of birth",
                          width: size.width * 0.5 - 25,
                        ),
                      ],
                    ),

                    /// Phone Number
                    const SizedBox(height: 20),
                    TBTextFeild(
                      hinText: "Phone number",
                    ),

                    /// Location
                    const SizedBox(height: 20),
                    TBTextFeild(
                      hinText: "Location",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: TBButton(
                child: TBText(
                  "Save",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  textSize: TBTextSize.large,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
