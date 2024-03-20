import 'dart:math';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import  'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';


class VerifyOTP extends StatelessWidget {
  const VerifyOTP({super.key});

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
          "Verify OTP",
          textColor: TBColor.primary,
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
        ),
     ),
     body: Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      padding: const EdgeInsets.all(20),
      child:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Please enter OTP code sent to "),
            const Text("+855 15 7*** **7"),
            const SizedBox(
              height: 30,
            ),
            Form(
             
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:TBTextFeild(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hinText: "",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:TBTextFeild(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hinText: "",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:TBTextFeild(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hinText: "",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )
                  ),
                  SizedBox(
                   width: 50,
                    height: 50,
                    child:TBTextFeild(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hinText: "",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:TBTextFeild(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hinText: "",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:TBTextFeild(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hinText: "",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )
                  ),

                ],
              ) ,
              
              ),
            const SizedBox(
              height: 50,
            ),

            ///Text confirm code
            const Center(
              child:  SizedBox(
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
                    onTap: () {},
                    backgroundColor: TBColor.primary,
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TBText(
                            "Verify",
                            fontWeight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white,
                          )
                        ],
                    ) ,
            ),
            
          ],),
      ),
     ),
    );
  }
}