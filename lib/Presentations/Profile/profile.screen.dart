import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_icons.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/presentations/Widgets/tb_button.dart';
import 'package:thortbal/presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Core/utils/tb_global_funs.dart';
import 'package:thortbal/presentations/Profile/Book-History/book_history.screen.dart';
import 'package:thortbal/presentations/Profile/Bookmarks/bookmark.screen.dart';
import 'package:thortbal/presentations/Profile/Refund/refund.screen.dart';
import 'package:thortbal/presentations/Profile/Review/review.screen.dart';

import 'package:thortbal/presentations/Authentication/changePassword.screen.dart';

import 'package:thortbal/presentations/Authentication/login.screen.dart';

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
        color: TBColors.secondary,
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
                      InkWell(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: TBColors.primary,
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
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TBText(
                            "Hey, Sothea Ban",
                            textColor: TBColors.primary,
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
                              color: TBColors.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TBText(
                              "ID: 238sf2X2",
                              textColor: TBColors.primary,
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
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: TBColors.background,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                    // right: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileRow(
                      title: "Booking History",
                      assetName: TBIcons.roundHistory,
                      child: const TBBookHistoryScreen(),
                    ),
                    profileRow(
                      title: "Refund",
                      assetName: TBIcons.refundDollar,
                      child: const TBRefundScreen(),
                    ),
                    profileRow(
                      title: "Bookmarks",
                      assetName: TBIcons.bookmark,
                      child: const TBBookmarkScreen(),
                    ),
                    profileRow(
                      title: "Your Reviews",
                      assetName: TBIcons.rectangleStar,
                      child: const TBReviewScreen(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 32, left: 6),
                      child: TBText(
                        "Settings",
                        textSize: TBTextSize.medium,
                        textColor: TBColors.label,
                      ),
                    ),
                    profileRow(
                      title: "Change Password",
                      assetName: TBIcons.lock,
                      child: const TBChangePassword(),
                    ),
                    profileRow(
                      title: "Manager Account",
                      assetName: TBIcons.profile,
                      child: const TBReviewScreen(),
                    ),
                    // Log-Out Bottom
                    TBButton(
                      onTap: () => _onLogout(),
                      backgroundColor: TBColors.warning,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          TBText(
                            "Logout",
                            fontWeight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white,
                          )
                        ],
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

  /// Logout fuction
  void _onLogout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const TBLoginScreen(
          isFromLogout: true,
        ),
      ),
      (route) => false,
    );
  }

  /// Profile Row
  Widget profileRow({
    required String title,
    required String assetName,
    required Widget child,
  }) {
    return InkWell(
      onTap: () {
        _showBottomSheet(child: child);
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
              // ignore: deprecated_member_use
              color: TBColors.label,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TBText(
                title,
                textSize: TBTextSize.large,
                // textColor: TBColors.label,
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

  /// Show Bottom Sheet
  _showBottomSheet({required Widget child}) {
    showTBBottomSheet(context: context, child: child);
  }
}
