import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBNotificationScreen extends StatefulWidget {
  const TBNotificationScreen({Key? key}) : super(key: key);

  @override
  State<TBNotificationScreen> createState() => _TBNotificationScreenState();
}

class _TBNotificationScreenState extends State<TBNotificationScreen> {
  final double _itemSize = 88;

  var isRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TBText(
                    "Today",
                    textSize: TBTextSize.medium,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    splashColor: TBColor.secondary,
                    onTap: () {},
                    child: TBText(
                      "Mark all as read",
                      textSize: TBTextSize.medium,
                      fontWeight: FontWeight.w600,
                      textColor: TBColor.primary,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isRead = !isRead;
                });
              },
              child: _findMatch(isRead: isRead),
            ),
            _booking(success: false, isRead: false),
            _event(isRead: true),

            /// Earlier List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TBText(
                    "Earlier",
                    textSize: TBTextSize.medium,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    splashColor: TBColor.secondary,
                    onTap: () {},
                    child: TBText(
                      "Mark all as read",
                      textSize: TBTextSize.medium,
                      fontWeight: FontWeight.w600,
                      textColor: TBColor.primary,
                    ),
                  ),
                ],
              ),
            ),
            _booking(success: true, isRead: true),
            _event(isRead: false),
          ],
        ),
      ),
    );
  }

  /// App Bar
  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: TBColor.background,
      surfaceTintColor: TBColor.background,
      leadingWidth: 65,
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
        child: TBBackButton(
          onTap: () => Navigator.pop(context),
        ),
      ),
      title: TBText(
        "Notification",
        textSize: TBTextSize.xlarge,
        fontWeight: FontWeight.bold,
        textColor: TBColor.primary,
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 35,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: TBColor.primary,
          ),
          child: const TBText(
            "2 New",
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Widget _todayList() {
    return Column();
  }

  /// Find Match
  Widget _findMatch({bool isRead = false}) {
    return Container(
      width: double.infinity,
      height: _itemSize,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: isRead ? Colors.white : TBColor.secondary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: TBColor.primary.withOpacity(0.2),
            child: Transform.rotate(
              angle: pi / 3.5,
              child: Icon(
                Icons.sports_baseball,
                color: TBColor.primary,
                size: 28,
              ),
            ),
          ),

          const SizedBox(width: 15),

          /// Text Detail
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "Find Match",
                      textColor: TBColor.black,
                      textSize: TBTextSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                TBText(
                  "Your request #1234 has been approved",
                  textColor: Colors.grey,
                  textSize: TBTextSize.medium + 2,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: TBText(
              "1h ",
              textColor: Colors.grey,
              textSize: TBTextSize.medium - 2, // 10
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _event({bool isRead = false}) {
    return Container(
      width: double.infinity,
      height: _itemSize,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: isRead ? Colors.white : TBColor.secondary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: TBColor.primary.withOpacity(0.2),
            child: SvgPicture.asset(
              TBIcons.tbCalendarStar,
              width: 28,
              height: 28,
            ),
          ),

          const SizedBox(width: 15),

          /// Text Detail
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "Event",
                      textColor: TBColor.black,
                      textSize: TBTextSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                TBText(
                  "Watch SEAGAME at TK for Free",
                  textColor: Colors.grey,
                  textSize: TBTextSize.medium + 2,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),

          Flexible(
            child: Align(
              alignment: Alignment.topRight,
              child: TBText(
                "9h",
                textColor: Colors.grey,
                textSize: TBTextSize.medium - 2, // 10
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _booking({required bool success, bool isRead = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: isRead
          ? Colors.white
          : (success ? TBColor.secondary : TBColor.warning.withOpacity(0.08)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: success
                ? TBColor.primary.withOpacity(0.2)
                : TBColor.warning.withOpacity(0.15),
            child: SvgPicture.asset(
              success ? TBIcons.tbCalendar : TBIcons.tbCalendarCancel,
              width: success ? 28 : 25,
              height: success ? 28 : 25,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 15),

          /// Text Detail
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TBText(
                      "Booking ${success ? "Success" : "Cancelled"}",
                      textColor: TBColor.black,
                      textSize: TBTextSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                FittedBox(
                  child: TBText(
                    success
                        ? "Congratulations! your booking is \nconfirmed! We’re looking forward to\nsee your match."
                        : "Your booking #1234 has been\ncancelled",
                    textColor: Colors.grey,
                    textSize: TBTextSize.medium + 2,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    maxLines: success ? 3 : 2,
                  ),
                ),
              ],
            ),
          ),

          Flexible(
            child: Align(
              alignment: Alignment.topRight,
              child: TBText(
                "1h ",
                textColor: Colors.grey,
                textSize: TBTextSize.medium - 2, // 10
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Book Success
  /// Booking Cancel
  /// Event
}
