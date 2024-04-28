import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_icon.dart';
import 'package:thortbal/Constants/tb_textsize.dart';
import 'package:thortbal/Helpers/Widgets/tb_button.dart';
import 'package:thortbal/Helpers/Widgets/tb_text.widget.dart';

class TBSearchScreen extends StatefulWidget {
  const TBSearchScreen({super.key});

  @override
  State<TBSearchScreen> createState() => _TBSearchScreenState();
}

class _TBSearchScreenState extends State<TBSearchScreen> {
  final FocusNode _searchFocus = FocusNode();
  double _searchWidth = 120;
  bool _isList = true;

  @override
  void initState() {
    super.initState();

    _searchFocus.addListener(() {
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_searchFocus.hasFocus) {
            _searchWidth =
                MediaQueryData.fromView(WidgetsBinding.instance.window)
                        .size
                        .width *
                    0.8;
          } else {
            _searchWidth = 120;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff5f5f5),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isList = !_isList;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 100),
                    firstChild: Icon(
                      Icons.format_list_bulleted,
                      size: 24,
                      color: TBColor.primary,
                    ),
                    secondChild: Icon(
                      Icons.grid_view_rounded,
                      size: 24,
                      color: TBColor.primary,
                    ),
                    crossFadeState: _isList
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: _listCardWidget(),
              // child: _gridsCardWidget(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    var size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xfff5f5f5),
      surfaceTintColor: TBColor.background,
      centerTitle: false,
      leadingWidth: 65,
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, top: 4.0, bottom: 6),
        child: TBBackButton(
          onTap: () {
            if (_searchFocus.hasFocus) {
              setState(() {
                _searchFocus.unfocus();
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () => Navigator.pop(context),
                );
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      title: TBText(
        _searchFocus.hasFocus ? "" : "Find your\nfavorite fields",
        maxLines: 2,
        textAlign: TextAlign.start,
        textSize: TBTextSize.xlarge,
        fontWeight: FontWeight.bold,
        textColor: TBColor.primary,
      ),
      actions: [
        GestureDetector(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: _searchWidth,
            height: 44,
            curve: Curves.bounceInOut,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(1, 1),
                  color: Colors.black12,
                ),
              ],
            ),
            child: _searchTextField(size: size),
          ),
        )
      ],
    );
  }

  /// List Card
  Widget _listCardWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (ctx, index) {
          return _cardListItem(peoples: Random().nextInt(12));
        },
      ),
    );
  }

  /// Grid Card
  Widget _gridsCardWidget() {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.red,
          height: 260,
        );
      },
    );
  }

  /// Card List Item
  Widget _cardListItem({required int peoples}) {
    var isComplete = peoples == 11;
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 20, right: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          /// Information
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SvgPicture.asset(
                        TBIcons.tbLocationMark,
                        width: 16,
                        height: 16,
                        color: TBColor.label,
                      ),
                      const SizedBox(width: 4),
                      TBText(
                        "Terk Tla, Sen Sok",
                        textSize: TBTextSize.small,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),

                  /// Price
                  Container(
                    width: isComplete ? 125 : 90,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isComplete ? TBColor.primary : TBColor.secondary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          TBIcons.tbGroupPeople,
                          width: 16,
                          height: 16,
                          color: isComplete ? Colors.white : TBColor.primary,
                        ),
                        const SizedBox(width: 8),
                        TBText(
                          !isComplete ? "$peoples/11" : "Completed",
                          fontWeight: FontWeight.w600,
                          textSize: TBTextSize.medium,
                          textColor:
                              isComplete ? Colors.white : TBColor.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(TBIcons.tbStar, width: 16, height: 16),
                    const SizedBox(width: 4),
                    TBText(
                      "4.5",
                      fontWeight: FontWeight.w600,
                      textSize: TBTextSize.medium,
                      textColor: TBColor.label,
                    ),
                  ],
                ),
                SvgPicture.asset(TBIcons.tbBookmarkFill, width: 16, height: 16)
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Search Text Field
  TextField _searchTextField({required Size size}) {
    return TextField(
      focusNode: _searchFocus,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(Icons.search, size: 22),
        ),
        // isCollapsed: true,
        prefixIconConstraints: BoxConstraints.tight(const Size(24, 24)),
        isDense: false,
        // contentPadding: EdgeInsets.all(2),
      ),
    );
  }
}
