import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Find Match",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                    'assets/images/team_players.png'), // Replace with your asset image
              ),
              const Text('Team Information:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter your team name',
                ),
              ),
              const SizedBox(height: 24.0),
              const Text('Matching:',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                items: <String>['Small', 'Big'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                decoration: const InputDecoration(
                  labelText: 'Type of Pitch',
                ),
              ),
              DropdownButtonFormField<String>(
                items: <String>['Beginner', 'Intermediate', 'Advanced']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                decoration: const InputDecoration(
                  labelText: 'Team Level',
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(100, 40),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
