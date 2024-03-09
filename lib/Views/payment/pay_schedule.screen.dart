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
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PaySchedule extends StatefulWidget {
  const PaySchedule({super.key});

  @override
  State<PaySchedule> createState() => _PayScheduleState();
}
 final List<String> options = ['Option 1', 'Option 2', 'Option 3'];


String dropdownvalue ="8:30";
class _PayScheduleState extends State<PaySchedule> {
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
          "Schedule",
          textColor: TBColor.primary,
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          ///Container Stack page number 
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
                        color: TBColor.secondary,
                        shape: BoxShape.circle,
                      ),
                    child: Center(
                      child: TBText(
                        "2",
                        textColor: TBColor.primary,
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

          ///Create button Morning , afternoon .... 
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
             
              children: [
                Row(
                 
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  Container(
                    
                    width: 173,
                    height: 61,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: ElevatedButton(
                      child:TBText(
                        "Morning",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: TBColor.primary,
                      ),
                     onPressed: (){},
                     style: ButtonStyle(
                      shape:MaterialStateProperty.all(
            
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
            
                      ),)
                     ),
                     ),
                    
                  ),
                  Container(
                    width: 173,
                    height: 61,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: ElevatedButton(
                      child:TBText(
                        "Afternoon",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: TBColor.primary,
                      ),
                     onPressed: (){},
                     style: ButtonStyle(
                      shape:MaterialStateProperty.all(
            
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        
                      ),)
                     ),
                     ),
                    
                  )
                 ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  Container(
                    
                    width: 173,
                    height: 61,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: ElevatedButton(
                      child:TBText(
                        "Evening",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: TBColor.primary,
                      ),
                     onPressed: (){},
                     style: ButtonStyle(
                      shape:MaterialStateProperty.all(
            
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
            
                      ),)
                     ),
                     ),
                    
                  ),
                  Container(
                    width: 173,
                    height: 61,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: ElevatedButton(
                      child:TBText(
                        "Night",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: TBColor.primary,
                      ),
                     onPressed: (){},
                     style: ButtonStyle(
                      shape:MaterialStateProperty.all(
            
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        
                      ),)
                     ),
                     ),
                    
                  )
                 ],
                )
              ],
            ),
          ),
          /// Create select time and Schedule
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              color: TBColor.inputBackground,
              borderRadius: BorderRadius.circular(10), 
            ),
            child: Column(
              
              children: [
                //container select time 
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(  
                        child: Column(
                          children: [
                           Row(
          
                            children: [
                              Icon(Icons.timelapse,
                                color: TBColor.primary,),
                              TBText("Start Time",
                                textColor: TBColor.primary,
                                ),
                            ],
                           ),
                           Container(
                             margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                             child: DropdownButton(                       
                              items: const [
                                DropdownMenuItem(
                                  value: "8:30",
                                  child:Text("8:30")),
                                                     
                              ],
                                                     
                               onChanged: (String? newValue)
                               {
                                setState(() {
                                  dropdownvalue=newValue!;
                                });
                               }
                               ),
                           ),
                          ],
                        ),
                      ), 
                      Container(
                  child: Row(
                    children: [
                      Container(
                        
                        child: Column(
                          children: [
                           Row(
          
                            children: [
                              Icon(Icons.timelapse,
                                color: TBColor.primary,),
                              TBText("End Time",
                                textColor: TBColor.primary,),
                            ],
                           ),
                           Container(
                             margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                             child: DropdownButton(                       
                              items: const [
                                DropdownMenuItem(
                                  value: "8:30",
                                  child:Text("8:30")),
                                                     
                              ],
                                                     
                               onChanged: (String? newValue)
                               {
                                setState(() {
                                  dropdownvalue=newValue!;
                                });
                               }
                               ),
                           ),
                          ],
                        ),
                      ), 
                     
                    ],
                  ),
                ),
                    ],
                  ),
                ),
              //Divider 
              Divider(),

              /// Calendar 
              Container(
                child: SfCalendar(
                  view: CalendarView.month,
                  showNavigationArrow: true,
                )
              ) 
              ],
            ),
          ),


         ///Select Opponent level
          

        ///Bottom Navigation bar 
        
        ],
      ),
    );
  }
}