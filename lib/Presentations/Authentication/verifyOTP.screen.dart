import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:thortbal/Presentations/Authentication/login/login.controller.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';

class TBVerifyOTP extends StatelessWidget {
  const TBVerifyOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TBLoginController>(
        init: TBLoginController(repository: Get.find()),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
              child: TBBackButton(
                onTap: () => Navigator.pop(context),
              ),
            ),
            title: TBText(
              "Verify OTP",
              textColor: TBColors.primary,
              textSize: TBTextSize.xlarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Please enter OTP code sent to "),
                  const Text("+855 15 7*** **7"),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: TBTextFeild(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              hinText: "",
                              controller: controller.otpCode1TextEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: TBTextFeild(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              hinText: "",
                              controller: controller.otpCode2TextEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: TBTextFeild(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              hinText: "",
                              controller: controller.otpCode3TextEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: TBTextFeild(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              hinText: "",
                              controller: controller.otpCode4TextEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: TBTextFeild(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              hinText: "",
                              controller: controller.otpCode5TextEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: TBTextFeild(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              hinText: "",
                              controller: controller.otpCode6TextEditingController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
        
                  ///Text confirm code
                  const Center(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("code will expire In "),
                          TBText(
                            "1:30",
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
        
                  ///Button verify
                  TBButton(
                    onTap: () {
                      controller.verifyOTP();
                    },
                    backgroundColor: TBColors.primary,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TBText(
                          "Verify",
                          fontWeight: FontWeight.w600,
                          textSize: 16,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
          );
      }
    );
  }
}
