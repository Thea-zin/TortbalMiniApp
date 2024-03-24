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
            /// Filter Container
            _filterContainer(),

            const SizedBox(height: 20),

            /// History Card
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: double.infinity - 32,
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 20, right: 4),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: TBColor.primary.withOpacity(0.5),
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Images
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          /// Information
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TBText(
                                    "Boeung Ket Club",
                                    fontWeight: FontWeight.bold,
                                    textSize: TBTextSize.large,
                                  ),

                                  /// Location Address
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.map,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      TBText(
                                        "Terk Tla, Sen Sok",
                                        textSize: TBTextSize.small,
                                      )
                                    ],
                                  ),

                                  /// Price
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: TBColor.primary,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text.rich(
                                      TextSpan(
                                        text: "\$19.99",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: TBTextSize.small,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: " /Night",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    TBTextSize.small - 2 // 8px
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// More Options
                          IconButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(-5),
                            icon: const Icon(
                              Icons.more_vert,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
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
