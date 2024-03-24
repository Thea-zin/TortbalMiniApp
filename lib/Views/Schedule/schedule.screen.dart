import 'package:flutter/material.dart';

class TBScheduleScreen extends StatefulWidget {
  const TBScheduleScreen({super.key});

  @override
  State<TBScheduleScreen> createState() => _TBScheduleScreenState();
}

class _TBScheduleScreenState extends State<TBScheduleScreen> {
  // create datetime variable
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();

  // methods
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    ).then((value) => setState(() => _selectedDate = value!));
  }

  void _showStartTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) => setState(() => _selectedStartTime = value!));
  }

  void _showEndTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) => setState(() => _selectedEndTime = value!));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TBScheduleScreen'),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xFF524EEE),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              // Selectable day button
              TextButton(
                onPressed: _showDatePicker,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF524EEE),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Color(0xFF524EEE),
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Select Date',
                              style: TextStyle(
                                  color: Color(0xFF524EEE),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                          style: const TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Selectable start and end time button in a row
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _showStartTimePicker,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF524EEE),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFF524EEE),
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Start Time',
                                    style: TextStyle(
                                        color: Color(0xFF524EEE),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 55.00),
                                child: Text(
                                  '${_selectedStartTime.hour}:${_selectedStartTime.minute}',
                                  style: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextButton(
                      onPressed: _showEndTimePicker,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF524EEE),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFF524EEE),
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'End Time:',
                                    style: TextStyle(
                                        color: Color(0xFF524EEE),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 55.00),
                                child: Text(
                                  '${_selectedEndTime.hour}:${_selectedEndTime.minute}',
                                  style: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100.0,
              ),
              // Row(
              //   children: [
              //     const Padding(
              //       padding: EdgeInsets.only(left: 10.0),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const TBScheduleScreen()));
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.blue, // Button color
              //         foregroundColor: Colors.white, // Text color
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8.0),
              //         ),
              //         padding: const EdgeInsets.symmetric(vertical: 16.0),
              //       ),
              //       child: const Text('Create a match'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
