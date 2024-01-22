import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';
import 'package:thortbal/Constants/tb_textsize.dart';

class TBProfileScreen extends StatefulWidget {
  const TBProfileScreen({Key? key}) : super(key: key);

  @override
  State<TBProfileScreen> createState() => _TBProfileScreenState();
}

class _TBProfileScreenState extends State<TBProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: TBColor.secondary,
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: size.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: TBColor.primary,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.bottomRight,
                        child: const Icon(
                          Icons.edit,
                          size: 22,
                          fill: 0.8,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            "Hey, Sothea Ban",
                            style: TextStyle(
                              color: TBColor.primary,
                              fontSize: TBTextSize.xlarge - 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
