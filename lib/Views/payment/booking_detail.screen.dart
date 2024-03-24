import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBBookingDetail extends StatelessWidget {
  const TBBookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Booking Details",
          textColor: TBColor.primary,
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: TBColor.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: TBText(
                          "1",
                          textColor: Colors.white,
                          textSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: TBColor.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: TBText(
                          "2",
                          textColor: Colors.white,
                          textSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: TBColor.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: TBText(
                          "3",
                          textColor: TBColor.primary,
                          textSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          ///
          ///
          ///
          ///  Player Detail about user booking
          ///first Row

          Container(
            padding: const EdgeInsets.all(20),

            ///playerName and Boooking ID
            child: Column(
              children: [
                ///Player name title
                Row(
                  children: [
                    TBText(
                      "Player Name",
                      textSize: 16,
                      textColor: TBColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    TBText(
                      "Booking ID",
                      textSize: 16,
                      textColor: TBColor.primary,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                const Row(
                  children: [
                    TBText(
                      "Sothea Ban",
                      textSize: 14,
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    TBText(
                      "191085",
                      textSize: 16,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TBText(
                      "Match Date",
                      textSize: 16,
                      textColor: TBColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    TBText(
                      "Time",
                      textSize: 16,
                      textColor: TBColor.primary,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),

                const Row(
                  children: [
                    TBText(
                      "19 Dec 2023",
                      textSize: 14,
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    TBText(
                      "8:30 AM - 10:30 AM",
                      textSize: 16,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                ///Field
                Row(
                  children: [
                    TBText(
                      "Field",
                      textSize: 16,
                      textColor: TBColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    TBText(
                      "Boeung Ket club",
                      textSize: 16,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    TBText(
                      "Field",
                      textSize: 16,
                      textColor: TBColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "Booking Fee",
                      textSize: 14,
                    ),
                    TBText(
                      "0.50 USD",
                      textSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "VAT",
                      textSize: 14,
                    ),
                    TBText(
                      "0.15 USD",
                      textSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "Boeung Ket Club",
                      textSize: 14,
                    ),
                    TBText(
                      "19.99 USD",
                      textSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "TOTAL",
                      textSize: 14,
                    ),
                    TBText(
                      "20.64 USD",
                      textSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
