import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBBookmarkScreen extends StatelessWidget {
  const TBBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Bookmarks",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      backgroundColor: TBColor.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _bookmarkCard(status: 1),
            _bookmarkCard(status: 2),
            _bookmarkCard(status: 3),
          ],
        ),
      ),
    );
  }

  Widget _bookmarkCard({required int status}) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 20, right: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: TBColor.primary.withOpacity(0.5),
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Images
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          /// Information
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBText(
                    "Boeung Ket Club",
                    fontWeight: FontWeight.bold,
                    textSize: TBTextSize.large,
                  ),

                  /// Location Address
                  Row(
                    children: [
                      SvgPicture.asset(
                        TBIcons.tbLocationMark,
                        width: 16,
                        height: 16,
                        color: TBColor.label,
                      ),
                      const SizedBox(width: 4),
                      TBText(
                        "Terk Tla, Sen Sok",
                        textSize: TBTextSize.small,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),

                  /// Price
                  Container(
                    width: status == 1 ? 130 : (status == 2 ? 90 : 110),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: status == 2
                          ? TBColor.secondary
                          : (status == 1 ? TBColor.primary : TBColor.warning),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          TBIcons.tbGroupPeople,
                          width: 16,
                          height: 16,
                          color: status == 2 ? TBColor.primary : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        if (status == 2)
                          TBText(
                            "10/11",
                            fontWeight: FontWeight.w600,
                            textSize: TBTextSize.medium,
                            textColor: TBColor.primary,
                          ),
                        if (status == 1)
                          TBText(
                            "Completed",
                            fontWeight: FontWeight.w600,
                            textSize: TBTextSize.medium,
                            textColor: Colors.white,
                          ),
                        if (status == 3)
                          TBText(
                            "Expired",
                            fontWeight: FontWeight.w600,
                            textSize: TBTextSize.medium,
                            textColor: Colors.white,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(TBIcons.tbStar, width: 16, height: 16),
                    const SizedBox(width: 4),
                    TBText(
                      "4.5",
                      fontWeight: FontWeight.w600,
                      textSize: TBTextSize.medium,
                      textColor: TBColor.label,
                    ),
                  ],
                ),
                SvgPicture.asset(TBIcons.tbBookmarkFill, width: 16, height: 16)
              ],
            ),
          )
        ],
      ),
    );
  }
}