import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_icons.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/presentations/Widgets/tb_button.dart';
import 'package:thortbal/presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Core/utils/tb_global_funs.dart';
import 'package:thortbal/presentations/Profile/Refund/request_refund.screen.dart';

class TBRefundScreen extends StatelessWidget {
  const TBRefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColors.background,
        surfaceTintColor: TBColors.background,
        leadingWidth: 65,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Refund",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColors.primary,
        ),
      ),
      backgroundColor: TBColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Request Refund Button
            TBButton(
              onTap: () {
                showTBBottomSheet(
                  context: context,
                  child: TBRequestRefundScreen(),
                );
              },
              child: TBText(
                "Request Refund",
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                textSize: TBTextSize.large,
              ),
            ),

            const SizedBox(height: 20),

            /// Title of recented Refund
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TBText(
                "Recent requested refund",
                textColor: TBColors.label,
                fontWeight: FontWeight.w500,
                textSize: TBTextSize.medium,
              ),
            ),

            /// List of recented Refund

            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 3,
                  itemBuilder: (ctx, index) {
                    // Recent Refund Card
                    return Container(
                      width: double.infinity,
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// Date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TBText(
                                "18 Mar 2023",
                                textSize: TBTextSize.xsmall,
                              ),
                              const SizedBox(height: 6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    TBIcons.clock,
                                    width: 8,
                                    height: 8,
                                    color: TBColors.label,
                                  ),
                                  const SizedBox(width: 4),
                                  TBText(
                                    "12:00 PM",
                                    textSize: TBTextSize.xsmall,
                                  ),
                                ],
                              )
                            ],
                          ),

                          /// Status
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: TBColors.primary,
                                child: const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 10),
                              TBText(
                                "Completed",
                                textColor: TBColors.primary,
                                textSize: TBTextSize.medium,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),

                          /// Price
                          TBText(
                            "\$9.51",
                            textSize: TBTextSize.medium,
                            textColor: TBColors.warning,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
