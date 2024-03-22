import 'dart:math';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import  'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';
import 'package:thortbal/Helpers/Widgets/tb_textfield.widget.dart';


class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

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
          "Booking Details",
          textColor: TBColor.primary,
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      body:Column(
        children: [
           Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                
                child: Stack(
                
                  alignment: Alignment.center, 
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: TBColor.primary,
                            shape: BoxShape.circle,
                          ),
                        child: const  Center(
                          child: TBText(
                            "1",
                            textColor: Colors.white,
                            textSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      
                      Container(                  
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: TBColor.primary,
                            shape: BoxShape.circle,
                          ),
                        child: const  Center(
                          child:  TBText(
                            "2",
                            textColor: Colors.white,
                            textSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  Container(
                        
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: TBColor.primary,
                            shape: BoxShape.circle,
                          ),
                        child: const Center(
                          child: TBText(
                            "3",
                            textColor: Colors.white,
                            textSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    
                    ],
                    )
                  ],
                ),
              ),


             ///Content widget 
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                children: [
                                  TBText(
                                    "Bank Or Mobile Wallet",
                                    textSize: 16,
                                    textColor: TBColor.primary,
                                    fontWeight: FontWeight.bold,
                                    ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                ],
                              ),
                              

                          ],
                        ),
                    
            ),
            Container(
              padding: const EdgeInsets.all(20),
       
              child: Column(
                          children: [
                             Row(
                              children: [

                                SvgPicture.asset(TBIcons.tbABA,
                               
                                ),
                                TextButton(
                                style: const  ButtonStyle(
                       
                                ),
                                onPressed: () { },
                                child:Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                          
                                        
                                            const TBText(
                                                        "ABA Pay",
                                                        textSize: 16,
                                                        textColor: Colors.black,
                                                        fontWeight: FontWeight.bold,

                                            ),

                                            TBText(
                                                  "Tap to pay with ABA pay",
                                                  textColor: TBColor.label,
                                                  
                                                  
                                                  )
                                           ],
                                        ),
                                  )
                                  ],
                            ),
                            Row(
                              children: [

                                SvgPicture.asset(TBIcons.tbABA,
                               
                                ),
                                TextButton(
                                style: const  ButtonStyle(
                       
                                ),
                                onPressed: () { },
                                child:Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                            
                                            const TBText(
                                                        "ACLEDA Mobile",
                                                        textSize: 16,
                                                        textColor: Colors.black,
                                                        fontWeight: FontWeight.bold,

                                            ),

                                            TBText(
                                                  "Tap to pay with ACLEDA",
                                                  textColor: TBColor.label,
                                                  
                                                  
                                                  )
                                           ],
                                        ),
                                  )
                                  ],
                            ),
                            Row(
                              children: [

                                SvgPicture.asset(TBIcons.tbABA,
                               
                                ),
                                TextButton(
                                style: const  ButtonStyle(
                       
                                ),
                                onPressed: () { },
                                child:Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                            
                                            const TBText(
                                                        "AMK CLICK Pay",
                                                        textSize: 16,
                                                        textColor: Colors.black,
                                                        fontWeight: FontWeight.bold,

                                            ),

                                            TBText(
                                                  "Tap to pay with AMK",
                                                  textColor: TBColor.label,
                                                  
                                                  
                                                  )
                                           ],
                                        ),
                                  )
                                  ],
                            ),
                            SizedBox(
                              
                              child: Row(
                                children: [
                                  TBText(
                                        "Credit Card",
                                        textColor: TBColor.primary,
                                        fontWeight: FontWeight.bold,
                                        textSize: 16,
                                      ),
                                ], 
                              )
                            ),

                            ///Credit card 
                             Row(
                              children: [

                                SvgPicture.asset(TBIcons.tbABA,
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.contain,
                                ),
                                TextButton(
                                style: const  ButtonStyle(
                       
                                ),
                                onPressed: () { },
                                child:Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                            
                                            const TBText(
                                                        "Credit/Debit Card",
                                                        textSize: 16,
                                                        textColor: Colors.black,
                                                        fontWeight: FontWeight.bold,

                                            ),

                                            TBText(
                                                  "Tap to pay with AMK",
                                                  textColor: TBColor.label,
                                                  
                                                  
                                                  )
                                           ],
                                        ),
                                  )
                                  ],
                            ),
                             Row(
                              children: [

                                SvgPicture.asset(TBIcons.tbABA,
                               
                                ),
                                TextButton(
                                style: const  ButtonStyle(
                       
                                ),
                                onPressed: () { },
                                child:Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                            
                                            const TBText(
                                                        "AMK CLICK Pay",
                                                        textSize: 16,
                                                        textColor: Colors.black,
                                                        fontWeight: FontWeight.bold,

                                            ),

                                            TBText(
                                                  "Tap to pay with AMK",
                                                  textColor: TBColor.label,
                                                  
                                                  
                                                  )
                                           ],
                                        ),
                                  )
                                  ],
                            ),
                            

                            
                            
                          ],
              ),
            )
             
        ],
      ),
    );
  }
}