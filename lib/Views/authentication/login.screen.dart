import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';

class TBLoginScreen extends StatefulWidget {
  const TBLoginScreen({super.key});

  @override
  State<TBLoginScreen> createState() => _TBLoginScreenState();
}

class _TBLoginScreenState extends State<TBLoginScreen> {
  var _isObscureText = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "Log In",
            textSize: TBTextSize.xlarge,
            fontWeight: FontWeight.bold,
            textColor: TBColor.primary,
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
                    color: TBColor.inputBackground,
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
                              TBIcons.tbMail,
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
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: TBColor.inputBackground,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    child: TBTextFeild(
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
                              TBIcons.tbLock,
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
                        textColor: TBColor.label,
                        textSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: TBText(
                          "Sign Up ",
                          textColor: TBColor.primary,
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
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, "/main"),
                      backgroundColor: TBColor.primary,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TBText(
                            "Log in",
                            fontWeight: FontWeight.bold,
                            textSize: 16,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    )),
              ],
            ),

            /// Phone number tab
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: TBColor.inputBackground,
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
                          margin: const EdgeInsets.only(left: 8, right: 12),
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          width: double.infinity,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                TBIcons.tbCambodia,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: size.width / 2 - 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
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
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    _signUpWithButton(
                        imagePath: TBIcons.tbFacebook,
                        title: "Continue with Facebook",
                        onTap: () {}),
                    const SizedBox(height: 20),
                    _signUpWithButton(
                      imagePath: TBIcons.tbGoogle,
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
                            onTap: () => Navigator.pop(context),
                            child: TBText(
                              "Sign Up",
                              textSize: 14,
                              textColor: TBColor.primary,
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
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, "/main"),
                          backgroundColor: TBColor.primary,
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
          border: Border.all(width: 1, color: TBColor.label),
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
