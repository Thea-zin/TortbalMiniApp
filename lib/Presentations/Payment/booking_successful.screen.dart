import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';

class TBBookingSuccessful extends StatelessWidget {
  const TBBookingSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TBText(
                "Booking Successful! ",
                textSize: 24,
                textColor: TBColors.primary,
                fontWeight: FontWeight.bold,
              ),
              const TBText("You’ve successfully book the match."),
              const SizedBox(
                height: 20,
              ),

              ///QR code designe

              ///Summaries field
              Container(
                color: TBColors.inputBackground,
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TBText(
                            "Field",
                            textSize: 16,
                            textColor: TBColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          const TBText(
                            "Sunny sport Club",
                            textSize: 16,
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TBText(
                            "Field",
                            textSize: 16,
                            textColor: TBColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          const TBText(
                            "19 DEC 2022",
                            textSize: 16,
                          ),
                          const TBText(
                            "8:30 ~ 10:30",
                            textSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
