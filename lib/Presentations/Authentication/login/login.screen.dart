import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thortbal/Presentations/Authentication/login/login.controller.dart';
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Core/resource/tb_icons.dart';
import 'package:thortbal/Presentations/Widgets/tb_textfield.widget.dart';
import 'package:thortbal/Core/utils/tb_global_funs.dart';
import 'package:thortbal/Presentations/Authentication/signUp.screen.dart';

class TBLoginScreen extends StatefulWidget {
  const TBLoginScreen({this.isFromLogout = false, super.key});
  final bool isFromLogout;

  @override
  State<TBLoginScreen> createState() => _TBLoginScreenState();
}

class _TBLoginScreenState extends State<TBLoginScreen> {
  var _isObscureText = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<TBLoginController>(
        init: TBLoginController(repository: Get.find()),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: TBColors.background,
                surfaceTintColor: TBColors.background,
                leadingWidth: 65,
                toolbarHeight: 80,
                leading: !widget.isFromLogout
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 4.0, bottom: 6),
                        child: TBBackButton(
                          onTap: () => Navigator.pop(context),
                          // onTap: () => controller.login(),
                        ),
                      )
                    : null,
                title: TBText(
                  "Log In",
                  textSize: TBTextSize.xlarge,
                  fontWeight: FontWeight.bold,
                  textColor: TBColors.primary,
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Email"),
                    Tab(text: "Phone Number"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 20,
                        ),
                        decoration: BoxDecoration(
                          color: TBColors.inputBackground,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: TBTextFeild(
                           
                            keyboardType: TextInputType.emailAddress,
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            maxWidthPrefix: 100,
                            prefix: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    TBIcons.mail,
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(width: 6),
                                  TBText(
                                    "Email:",
                                    textSize: TBTextSize.large - 2,
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black87,
                                  ),
                                ],
                              ),
                            ),
                            hinText: "tortball@gmail.com",
                            controller: controller.emailTextEditingController,
                            // onChanged: (value) {
                            //   TBLoginController.email.value = value;
                            // },
                            
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: TBColors.inputBackground,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: TBTextFeild(
                            controller: controller.passwordTextEditingController,
                            obscureText: _isObscureText,
                            hinText: "password",
                            keyboardType: TextInputType.phone,
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            maxWidthPrefix: 100,
                            prefix: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    TBIcons.lock,
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(width: 6),
                                  TBText(
                                    "Password:",
                                    textSize: TBTextSize.medium,
                                    fontWeight: FontWeight.w600,
                                    textColor: Colors.black87,
                                  ),
                                ],
                              ),
                            ),
                            suffix: InkWell(
                              onTap: () {
                                setState(
                                    () => _isObscureText = !_isObscureText);
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
                                    color: TBColors.primary,
                                  ),
                                  secondChild: Icon(
                                    Icons.visibility_off,
                                    size: 20,
                                    color: TBColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TBText(
                              "Already have an account?",
                              textColor: TBColors.label,
                              textSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            InkWell(
                              onTap: () => _onSignUp(),
                              child: TBText(
                                "Sign Up ",
                                textColor: TBColors.primary,
                                textSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 358,
                        height: 75,
                        child: TBButton(
                          // onTap: () => Navigator.pushReplacementNamed(
                          //     context, "/main"),
                          onTap: () {
                            controller.login();
                          },
                          backgroundColor: TBColors.primary,
                          child: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 100),
                            crossFadeState: controller.isLoading
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            firstChild: TBText(
                              controller.isLoading ? "Loading..." : "Log in",
                              fontWeight: FontWeight.bold,
                              textSize: 16,
                              textColor: Colors.white,
                            ),
                            secondChild: const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Phone number tab
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: TBColors.inputBackground,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: TBTextFeild(
                            keyboardType: TextInputType.phone,
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            maxWidthPrefix: 100,
                            prefix: Center(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 8, right: 12),
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                width: double.infinity,
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      TBIcons.cambodia,
                                      width: 18,
                                      height: 18,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 4,
                                      ),
                                      child: VerticalDivider(
                                        width: 1,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    TBText(
                                      "+855",
                                      textSize: TBTextSize.large - 2,
                                      fontWeight: FontWeight.w600,
                                      textColor: Colors.black87,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            hinText: "086 000 000",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TBText(
                          "Please note that by signing up your user account, you are accepting our Terms of Use and Privacy Policy.",
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          textSize: TBTextSize.medium,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: size.width / 2 - 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                            ),
                            TBText(
                              "Or",
                              textSize: TBTextSize.medium,
                              fontWeight: FontWeight.w500,
                            ),
                            Container(
                              height: 1,
                              width: size.width / 2 - 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          _signUpWithButton(
                              imagePath: TBIcons.facebook,
                              title: "Continue with Facebook",
                              onTap: () {}),
                          const SizedBox(height: 20),
                          _signUpWithButton(
                            imagePath: TBIcons.google,
                            title: "Continue with Google",
                            onTap: () {},
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TBText(
                                  "Already Having Account ?",
                                  textSize: 14,
                                ),
                                InkWell(
                                  onTap: () => _onSignUp(),
                                  child: TBText(
                                    "Sign Up",
                                    textSize: 14,
                                    textColor: TBColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              width: 358,
                              height: 75,
                              child: TBButton(
                                onTap: () => Navigator.pushReplacementNamed(
                                    context, "/main"),
                                backgroundColor: TBColors.primary,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TBText(
                                      "Log in",
                                      fontWeight: FontWeight.w600,
                                      textSize: 16,
                                      textColor: Colors.white,
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Sign Up
  void _onSignUp() {
    if (widget.isFromLogout) {
      showTBBottomSheet(
        context: context,
        child: const TBSignupNumberphone(),
      );
    } else {
      Navigator.pop(context);
    }
  }

  Widget _signUpWithButton({
    required String imagePath,
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
          border: Border.all(width: 1, color: TBColors.label),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(width: 20),
            TBText(
              title,
              textSize: TBTextSize.medium + 2, // 14
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
