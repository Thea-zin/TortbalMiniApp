import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Presentations/Widgets/tb_text.widget.dart';
import 'package:thortbal/Presentations/Home/home.screen.dart';
import 'package:thortbal/Presentations/Profile/profile.screen.dart';
import 'package:thortbal/Presentations/Schedule/schedule.screen.dart';

class TBMainScreen extends StatefulWidget {
  const TBMainScreen({super.key});

  @override
  State<TBMainScreen> createState() => _TBMainScreenState();
}

class _TBMainScreenState extends State<TBMainScreen> {
  final List<Widget> _bottomNavItems = [
    const TBHomeScreen(),
    const TBScheduleScreen(),
    const TBProfileScreen()
  ];

  final Color _unSelectedTabColor = Colors.grey;
  final Color _selectedTabColor = TBColor.primary;

  var _selectedIndex = 0;

  final double _cornerRadius = 36;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0
          ? const Color.fromRGBO(168, 194, 255, 1)
          : Colors.white,
      body: [..._bottomNavItems][_selectedIndex],
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 48, right: 48, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_cornerRadius),
            topRight: Radius.circular(_cornerRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _setSelectedIndexTo(index: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 32,
                    color: _selectedIndex == 1
                        ? _selectedTabColor
                        : _unSelectedTabColor,
                  ),
                  TBText(
                    "Schedule",
                    textColor: _selectedIndex == 1
                        ? _selectedTabColor
                        : _unSelectedTabColor,
                    textSize: TBTextSize.medium,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _setSelectedIndexTo(index: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 32,
                    color: _selectedIndex == 2
                        ? _selectedTabColor
                        : _unSelectedTabColor,
                  ),
                  TBText(
                    "Profile",
                    textColor: _selectedIndex == 2
                        ? _selectedTabColor
                        : _unSelectedTabColor,
                    textSize: TBTextSize.medium,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => _setSelectedIndexTo(index: 0),
        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: TBColor.secondary, width: 10),
          ),
          child: AnimatedRotation(
            turns: _selectedIndex == 0 ? 0.5 : 0,
            duration: const Duration(milliseconds: 500),
            child: SvgPicture.asset(TBIcons.tbBall, width: 60, height: 60),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _setSelectedIndexTo({required int index}) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
