// ignore: file_names
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_image.dart';
import 'package:thortbal/Core/resource/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Solo/solo_option.screen.dart';
import 'package:thortbal/Presentations/Team/team.dart';

class TBFindMatchScreen extends StatelessWidget {
  const TBFindMatchScreen({Key? key}) : super(key: key);

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
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Find Match",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: TBText(
                  'Choose your type',
                  textColor: Colors.black45,
                  textSize: TBTextSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              OptionCard(
                imageAsset: TBImages.tbSoloPlayer,
                onTap: () => _showBottomSheet(
                  context: context,
                  child: const SoloOption(),
                ),
              ),
              const SizedBox(height: 16),
              OptionCard(
                imageAsset: TBImages.tbTeamPlayers,
                onTap: () => _showBottomSheet(
                  context: context,
                  child: const Team(),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  _showBottomSheet({required BuildContext context, required Widget child}) {
    showCupertinoModalBottomSheet(
        overlayStyle: SystemUiOverlayStyle.light,
        barrierColor: Colors.black45,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (context) {
          return child;
        });
  }
}

class OptionCard extends StatelessWidget {
  final String imageAsset;

  final VoidCallback onTap;

  const OptionCard({
    Key? key,
    required this.imageAsset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: TBColor.secondary,
      child: Container(
        width: 250,
        height: 240,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Image.asset(imageAsset),
      ),
    );
  }
}
