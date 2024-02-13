import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBEditProfile extends StatefulWidget {
  const TBEditProfile({super.key});

  @override
  State<TBEditProfile> createState() => _TBEditProfileState();
}

class _TBEditProfileState extends State<TBEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColor.background,
        leadingWidth: 65,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.grey.withOpacity(0.25),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              foregroundColor: TBColor.secondary,
            ),
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: TBColor.primary,
            ),
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
      body: Column(
        children: [
          // Profile Image
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
        ],
      ),
    );
  }
}
