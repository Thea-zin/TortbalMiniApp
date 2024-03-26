import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thortbal/Constants/tb_icon.dart';

class TBLoginScreen extends StatelessWidget {
  const TBLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Log in",
            textColor: TBColor.primary,
            textSize: TBTextSize.xlarge,
            fontWeight: FontWeight.bold,
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
            Column(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 10),
                width: 358,
                height: 60,
                decoration: BoxDecoration(
                  color: TBColor.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 200,
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: TBColor.primary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const TBText(
                            "Tortbal : ",
                            textSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )),
                    const Expanded(
                        flex: 2,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tortbal@gmail.com',
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 10),
                width: 358,
                height: 60,
                decoration: BoxDecoration(
                  color: TBColor.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ///email
                    Expanded(
                        child: SizedBox(
                      width: 200,
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: TBColor.primary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const TBText(
                            "Password:",
                            textSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )),
                    const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*******',
                          ),
                        )),
                  ],
                ),
              ),

              ///Test button
              // SizedBox(

              //   child: TBButton(
              //    backgroundColor: TBColor.warning,

              //     onTap: (){},
              //     child: Row(
              //       children: [
              //         TBText("Hello button"),
              //         SvgPicture.asset(TBIcons.tbABA,
              //         width: 48,
              //         height: 48,
              //         fit: BoxFit.contain,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              ///Testfild test
              // TBTextFeild(
              //   maxWidthPrefix: 100,
              //   prefix:Center(
              //     child: Row(
              //       children: [
              //         Icon(Icons.home),
              //         TBText("Home"),
              //       ],
              //     ) ,
              //   ),
              //   ///Testing suffix
              //   suffix:Icon(Icons.home) ,
              // ),

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
            ]),

            //Phone number tab
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: TBColor.inputBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300.0,
                          height: 58,
                          // Adjust the width according to your requirement
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "12 345 678",
                              suffix: SizedBox(width: 50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: 358,
                  child: const Text(
                    "Please note that by signing up your user account, you are accepting our Terms of Use and Privacy Policy.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Divider(
                    color: TBColor.label,
                    thickness: 1,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 358,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const TBText(
                          "Continue with facebook",
                          fontWeight: FontWeight.w600,
                        ),
                        icon: SvgPicture.asset(TBIcons.tbFacebook),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TBColor.inputBackground,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 358,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: const TBText(
                                "Continue with facebook",
                                fontWeight: FontWeight.w600,
                              ),
                              icon: SvgPicture.asset(TBIcons.tbGoogle),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TBColor.inputBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
