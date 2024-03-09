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


class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

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
      body:Column(children: [
         Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Stack(
            
              alignment: Alignment.center, 
              children: [
                Divider(),
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
                    child: Center(
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
                    child: Center(
                      child: TBText(
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
                        color: TBColor.secondary,
                        shape: BoxShape.circle,
                      ),
                    child: Center(
                      child: TBText(
                        "3",
                        textColor: TBColor.primary,
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
        /// 
        /// 
        Container(

            
            child: Column(children: [
              Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TBText("Player Name",
              fontWeight: FontWeight.bold,
              textSize:16,
              textColor: TBColor.primary
              ,),
            TBText("Booking ID",
              fontWeight: FontWeight.bold,
              textSize:16,
              textColor: TBColor.primary)
          ],
        ),
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Sothea Ban"),
            Text("1234@#")
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          
          child: Column(children: [
             Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TBText("Match date",
              fontWeight: FontWeight.bold,
              textSize:16,
              textColor: TBColor.primary
              ,),
            TBText("Booking ID",
              fontWeight: FontWeight.bold,
              textSize:16,
              textColor: TBColor.primary)
          ],
           ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("12 Dec 2023"),
                Text("12 - 13")
              ],
            ),
          ],),
        ),
        
        Row(
         
          children: [
            TBText("Match date",
              fontWeight: FontWeight.bold,
              textSize:16,
              textColor: TBColor.primary
              ,),
            
          ],
           ),
          Row(
              
              children: [
                Text("12 Dec 2023"),
              
              ],
            ),
            ],),
        ),
        
      ],) ,
    );
  }
}