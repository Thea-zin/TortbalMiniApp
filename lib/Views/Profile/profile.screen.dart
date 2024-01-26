import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBProfileScreen extends StatefulWidget {
  const TBProfileScreen({Key? key}) : super(key: key);

  @override
  State<TBProfileScreen> createState() => _TBProfileScreenState();
}

class _TBProfileScreenState extends State<TBProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: TBColor.secondary,
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    // const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: TBColor.primary,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.bottomRight,
                        child: const Icon(
                          Icons.edit,
                          size: 22,
                          fill: 0.8,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TBText(
                            "Hey, Sothea Ban",
                            textColor: TBColor.primary,
                            textSize: TBTextSize.xlarge - 4,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8, left: 8),
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: TBColor.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TBText(
                              "ID: 238sf2X2",
                              textColor: TBColor.primary,
                              textSize: TBTextSize.medium,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),

            /// Body
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(left: 15, right: 16, top: 32),
                decoration: BoxDecoration(
                  color: TBColor.background,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(28),
                    right: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileRow(
                      title: "Booking History",
                      assetName: TBIcons.tbRoundHistory,
                    ),
                    profileRow(
                      title: "Refund",
                      assetName: TBIcons.tbRefundDollar,
                    ),
                    profileRow(
                      title: "Bookmarks",
                      assetName: TBIcons.tbBookmark,
                    ),
                    profileRow(
                      title: "Your Reviews",
                      assetName: TBIcons.tbRectangleStar,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 32, left: 6),
                      child: TBText(
                        "Settings",
                        textSize: TBTextSize.medium,
                        textColor: TBColor.label,
                      ),
                    ),
                    profileRow(
                      title: "Change Password",
                      assetName: TBIcons.tbLock,
                    ),
                    profileRow(
                      title: "Manager Account",
                      assetName: TBIcons.tbProfile,
                    ),

                    // Log-Out Bottom

                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          // fixedSize: const Size(double.infinity, 52),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          surfaceTintColor: Colors.white,
                          foregroundColor: Colors.white70,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 20),
                            TBText(
                              "Log out",
                              textColor: Colors.white70,
                              fontWeight: FontWeight.bold,
                              textSize: TBTextSize.large,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileRow({required String title, required String assetName}) {
    return InkWell(
      onTap: () {
        showActionSheet();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: 24,
        width: double.infinity,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
              height: 24,
              color: TBColor.label,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TBText(
                title,
                textSize: TBTextSize.large,
                // textColor: TBColor.label,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  showActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.white,
        );
      },
    );
  }
}
