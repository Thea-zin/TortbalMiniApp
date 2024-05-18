import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';
import 'package:thortbal/Core/resource/tb_textSize.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';

class TBScheduleScreen extends StatelessWidget {
  const TBScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColors.secondary,
        surfaceTintColor: TBColors.background,
        leadingWidth: 65,
        toolbarHeight: 80,
        title: TBText(
          "Schedule",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColors.primary,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: TBColors.secondary,
        child: Column(
          children: [
            SfCalendar(
              view: CalendarView.month,
              showNavigationArrow: true,
              backgroundColor: TBColors.inputBackground,
              cellBorderColor: TBColors.inputBackground,
              headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Schedule",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: TBColors.primary),
                          ),
                          Text(
                            "12 Dec 2023",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: TBColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Text("Month")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
