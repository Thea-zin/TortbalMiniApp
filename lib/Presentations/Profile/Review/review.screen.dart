import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';

class TBReviewScreen extends StatefulWidget {
  const TBReviewScreen({super.key});

  @override
  State<TBReviewScreen> createState() => _TBReviewScreenState();
}

class _TBReviewScreenState extends State<TBReviewScreen> {
  var _ratingStar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
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
          "Review",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      backgroundColor: TBColor.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TBButton(
          onTap: () {},
          child: TBText(
            "Submit",
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            textSize: TBTextSize.large,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 54,
                  height: 50,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBText(
                      "Sugarcoat Club",
                      textSize: TBTextSize.medium,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(
                          TBIcons.tbLocationMark,
                          width: 8,
                          height: 8,
                          color: TBColor.label,
                        ),
                        const SizedBox(width: 4),
                        TBText(
                          "Terk Tla, Sen Sok",
                          textSize: TBTextSize.xsmall,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),

            /// Divider
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),

            /// Star Rating
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TBText(
                  "Are you satisfied with the club?",
                  textSize: TBTextSize.large,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                rating(to: 0);
                              } else {
                                rating(to: index + 1);
                              }
                            },
                            child: Icon(
                              Icons.star_rate_rounded,
                              size: 24,
                              color: _ratingStar >= index + 1
                                  ? Colors.amber
                                  : Colors.grey[350],
                            ),
                          );
                        }),
                      ),
                      const Spacer(),
                      TBText(
                        "Good",
                        textColor: TBColor.primary,
                        fontWeight: FontWeight.bold,
                        textSize: TBTextSize.large,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            /// Comment Text Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TBText(
                  "Write a review that can help another people",
                  textSize: TBTextSize.medium,
                ),
                const SizedBox(height: 10),
                TBTextFeild(
                  hinText: "I think...",
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void rating({required int to}) {
    setState(() {
      _ratingStar = to;
    });
  }
}
