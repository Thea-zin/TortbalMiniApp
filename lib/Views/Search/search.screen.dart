import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isList = !_isList;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
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
          onTap: () => Navigator.pop(context),
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

  TextField _searchTextField({required Size size}) {
    return TextField(
      focusNode: _searchFocus,
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
