import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBBookHistoryScreen extends StatefulWidget {
  const TBBookHistoryScreen({super.key});

  @override
  State<TBBookHistoryScreen> createState() => _TBBookHistoryScreenState();
}

class _TBBookHistoryScreenState extends State<TBBookHistoryScreen> {
  List<int> yearSelections = <int>[2019, 2020, 2021, 2022, 2023, 2024];
  var selectedYear = 2019;
  // final MenuController _menuController = MenuController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TBColor.background,
        leadingWidth: 65,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 4.0, bottom: 6),
          child: TBBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
        title: TBText(
          "Booking History",
          textSize: TBTextSize.xlarge,
          fontWeight: FontWeight.bold,
          textColor: TBColor.primary,
        ),
      ),
      backgroundColor: TBColor.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _filterContainer(),
            // _filterContainers(),
          ],
        ),
      ),
    );
  }

  /// Year Selection Button

  Row _filterContainer() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButton<int>(
            value: selectedYear,
            onChanged: (int? value) {
              // This is called when the user selects an item.
              setState(() {
                selectedYear = value!;
              });
            },
            selectedItemBuilder: (context) {
              return yearSelections.map<SizedBox>((int value) {
                return SizedBox(
                  height: 32,
                  child: Center(
                    child: TBText("$value"),
                  ),
                );
              }).toList();
            },
            isDense: true,
            icon: const Icon(Icons.arrow_downward_rounded, size: 18),
            underline: Container(height: 1),
            iconSize: 20.0,
            itemHeight: 48,
            borderRadius: BorderRadius.circular(6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            items: yearSelections.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: TBText("$value"),
              );
            }).toList(),
          ),
        ),
        // _filterContainers(),
      ],
    );
  }
/*
  Row _filterContainers() {
    return Row(
      children: [
        SubmenuButton(
          controller: _menuController,
          menuChildren: yearSelections.map<Widget>((int value) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedYear = value;
                  _menuController.close();
                });
              },
              child: SizedBox(
                width: 78,
                height: 32,
                child: TBText("$value"),
              ),
            );
          }).toList(),
          onOpen: () => setState(() {}),
          onClose: () => setState(() {}),
          child: Container(
            width: 78,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TBText("$selectedYear"),
                AnimatedRotation(
                  turns: _menuController.isOpen ? 0.25 : -0.25, // 0.25
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  */
}
