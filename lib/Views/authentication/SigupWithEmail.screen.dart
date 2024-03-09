import 'dart:math';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import  'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Sign Up",
          textColor: TBColor.primary,
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              padding: EdgeInsets.fromLTRB(15, 5, 5, 10),
              width:358 ,
              height: 60,
              decoration: BoxDecoration(
                 color: TBColor.inputBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
               children: [
                  Expanded(
                      child: Container(
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                              Icons.email,
                              color: TBColor.primary,
                            )
                            ),
                            SizedBox(width: 5,),
                            Container(
                              child: TBText(
                                "Tortbal : ",
                                textSize:16,
                                fontWeight: FontWeight.w500,
                              )
                            ),
                          ],
                        ),
                      )
                      ),
                  Expanded(
                    flex:2,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:'Tortbal@gmail.com', 

                      ),
                    )

                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              padding: EdgeInsets.fromLTRB(15, 5, 5, 10),
              width:358 ,
              height: 60,
              decoration: BoxDecoration(
                 color: TBColor.inputBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
               children: [
                  Expanded(
                      child: Container(
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                              Icons.lock,
                              color: TBColor.primary,
                            )
                            ),
                            SizedBox(width: 5,),
                            Container(
                              child: TBText(
                                "Password:",
                                textSize:16,
                                fontWeight: FontWeight.w500,
                              )
                            ),
                          ],
                        ),
                      )
                      ),
                  Expanded(
                    flex:1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:'*******', 
                        
                      ),
                    )

                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TBText("Already have an account?",
                    textColor: TBColor.label,
                    textSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  TBText("Log in ",
                    textColor: TBColor.primary,
                    textSize:14,
                    fontWeight: FontWeight.w700,

                  ),

                ],
              ),
            ),
             Container(
                  padding:EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 358,
                  height: 75,
                  child: TBButton(
                    onTap: () {},
                    backgroundColor: TBColor.primary,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TBText(
                            "Sign Up",
                            fontWeight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white,
                          )
                        ],
                    ) ,)
                )
          ],
        ),
      ),
    );
  }
}