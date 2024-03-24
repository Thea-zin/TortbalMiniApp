import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_image.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Match'),
        centerTitle: true,
        backgroundColor: const Color(0xFF524EEE),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
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
                    TBImages.tbTeamPlayers), // Replace with your asset image
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
