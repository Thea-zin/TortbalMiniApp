import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:thortbal/Constants/tb_color.dart";
import "package:thortbal/Constants/tb_icon.dart";
import "package:thortbal/Constants/tb_image.dart";
import "package:thortbal/Constants/tb_textsize.dart";
import "package:thortbal/Helpers/Widgets/tb_button.dart";
import "package:thortbal/Helpers/Widgets/tb_text.widget.dart";
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
    var size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: _appBar(),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              /// Background Color with gradient
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(175, 168, 242, 0.76),
                      Color.fromRGBO(232, 241, 255, 0.34),
                      Color.fromRGBO(168, 194, 255, 1),
                    ],
                  ),
                ),
              ),

              /// Location Address
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 60,
                    width: (size.width - 32) / 2,
                    // width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          TBIcons.tbLocationMark,
                          width: 16,
                          height: 16,
                          fit: BoxFit.fill,
                          color: TBColor.label,
                        ),
                        const SizedBox(width: 2),
                        TBText(
                          "Terk Tla, Sen Sok, Phnom Penh",
                          textSize: TBTextSize.medium,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.black87,
                        ),
                        const SizedBox(width: 2),
                        Transform.rotate(
                          angle: -pi / 2,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Image background
              Positioned(
                bottom: -80,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: size.width,
                  height: size.height / 2,
                  child: Image.asset(
                    TBImages.tbHome,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              /// Center View
              Positioned(
                top: 60 + 40, // 60 from location address and + 40 for padding
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    TBText(
                      "Ready to Play?",
                      textSize: TBTextSize.xlarge,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    TBText(
                      "Find Your Match & Hit the Field",
                      textSize: TBTextSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 40),
                    _findMatchButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _findMatchButton() {
    return GestureDetector(
      onTap: () => _showModalBottomSheet(context: context),
      child: Container(
        width: 180,
        height: 48,
        decoration: BoxDecoration(
          color: TBColor.primary,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: TBColor.primary.withOpacity(0.15),
              spreadRadius: 15,
            ),
            BoxShadow(
              color: TBColor.primary.withOpacity(0.25),
              spreadRadius: 10,
            ),
            BoxShadow(
              color: TBColor.primary.withOpacity(0.5),
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TBText(
              "Find Match",
              textSize: TBTextSize.large,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              TBIcons.tbBall,
              width: 22,
              height: 22,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Image.asset(
        TBImages.tbLogo,
        height: 140,
        width: 140,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: TBColor.inputBackground,
            child: SvgPicture.asset(
              TBIcons.tbSearch,
              width: 22,
              height: 22,
              color: TBColor.label,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundColor: TBColor.inputBackground,
              child: SvgPicture.asset(
                TBIcons.tbBell,
                width: 22,
                height: 22,
                color: TBColor.label,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _showModalBottomSheet({required BuildContext context}) {
    showTBBottomSheet(context: context, child: const TBFindMatchScreen());
  }
}
