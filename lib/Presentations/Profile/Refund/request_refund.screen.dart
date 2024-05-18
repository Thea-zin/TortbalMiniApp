import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';

// ignore: must_be_immutable
class TBRequestRefundScreen extends StatelessWidget {
  TBRequestRefundScreen({super.key});

  var _isObscureText = true;

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
          "Request Refund",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      backgroundColor: TBColor.background,
      body: StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Request Refund Button
              TBTextFeild(
                  hinText: "Password",
                  obscureText: _isObscureText,
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  suffix: InkWell(
                    onTap: () {
                      setState(() => _isObscureText = !_isObscureText);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: AnimatedCrossFade(
                        crossFadeState: _isObscureText
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                        firstChild: Icon(
                          Icons.visibility,
                          size: 20,
                          color: TBColor.primary,
                        ),
                        secondChild: Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: TBColor.primary,
                        ),
                      ),
                    ),
                  )),

              const SizedBox(height: 20),

              /// Title of recented Refund
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TBText(
                  "Recent requested refund",
                  textColor: TBColor.label,
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
                                      TBIcons.tbClock,
                                      width: 8,
                                      height: 8,
                                      color: TBColor.label,
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
                                  backgroundColor: TBColor.primary,
                                  child: const Icon(
                                    Icons.check_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                TBText(
                                  "Completed",
                                  textColor: TBColor.primary,
                                  textSize: TBTextSize.medium,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),

                            /// Price
                            TBText(
                              "\$9.51",
                              textSize: TBTextSize.medium,
                              textColor: TBColor.warning,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
