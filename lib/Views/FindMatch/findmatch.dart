// ignore: file_names
import 'package:flutter/material.dart';
import 'package:thortbal/Views/Solo/solo_option.dart';
import 'package:thortbal/Views/team/team.dart';


class FindMatch extends StatelessWidget {
  const FindMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Match',
      routes: {
        '/solo_option': (context) => const SoloOption(),
        '/team': (context) => const Team(),
      },
      home: Scaffold(
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
        body: const FindMatchScreen(),
      ),
    );
  }
}

class FindMatchScreen extends StatelessWidget {
  const FindMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Choose Your Preferences',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              OptionCard(
                imageAsset: 'assets/solo_player.png',
                onTap: () {
                  Navigator.pushNamed(context, '/solo_option');
                },
                label: '',
              ),
              const SizedBox(height: 16),
              OptionCard(
                imageAsset: 'assets/team_players.png',
                label: '',
                onTap: () {
                  Navigator.pushNamed(context, '/team');
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String imageAsset;
  final String label;
  final VoidCallback onTap;

  const OptionCard({
    Key? key,
    required this.imageAsset,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(imageAsset),
            Text(label),
          ],
        ),
      ),
    );
  }
}
