import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:thortbal/Presentations/Widgets/tb_button.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TBPaySchedule extends StatefulWidget {
  const TBPaySchedule({super.key});

  @override
  State<TBPaySchedule> createState() => _PayScheduleState();
}

final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

String dropdownvalue = "8:30";

class _PayScheduleState extends State<TBPaySchedule> {
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
                      child: const Center(
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
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 173,
                      height: 61,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                        child: TBText(
                          "Morning",
                          textSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: TBColor.primary,
                        ),
                      ),
                    ),
                    Container(
                      width: 173,
                      height: 61,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                        child: TBText(
                          "Afternoon",
                          textSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: TBColor.primary,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 173,
                      height: 61,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                        child: TBText(
                          "Evening",
                          textSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: TBColor.primary,
                        ),
                      ),
                    ),
                    Container(
                      width: 173,
                      height: 61,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                        child: TBText(
                          "Night",
                          textSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: TBColor.primary,
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
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: TBColor.inputBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                //container select time
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: TBColor.primary,
                              ),
                              TBText(
                                "Start Time",
                                textColor: TBColor.primary,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: DropdownButton(
                                items: const [
                                  DropdownMenuItem(
                                      value: "8:30", child: Text("8:30")),
                                ],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: TBColor.primary,
                                  ),
                                  TBText(
                                    "End Time",
                                    textColor: TBColor.primary,
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                child: DropdownButton(
                                    items: const [
                                      DropdownMenuItem(
                                          value: "8:30", child: Text("8:30")),
                                    ],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Divider
                const Divider(),

                /// Calendar

                SfCalendar(
                  view: CalendarView.month,
                  showNavigationArrow: true,
                  cellBorderColor: TBColor.inputBackground,
                  headerStyle: const CalendarHeaderStyle(
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),

          ///Select Opponent level
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: 368,
            height: 60,
            decoration: BoxDecoration(
              color: TBColor.inputBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton(
                dropdownColor: TBColor.inputBackground,
                underline: const SizedBox(),
                hint: const Text("Selected opponent level"),
                items: const [
                  DropdownMenuItem(
                      value: "Normal",
                      child: Text(
                        "Normal",
                      )),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                }),
          ),

          ///Bottom Navigation bar
        ],
      ),
    );
  }
}
