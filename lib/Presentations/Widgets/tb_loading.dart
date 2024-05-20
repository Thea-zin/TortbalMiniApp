import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:thortbal/Core/resource/tb_colors.dart';

class LoadingView {
  static show(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          var loadingSize = 45;
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: width / 2 - loadingSize,
            ),
            child: Container(
              alignment: Alignment.center,
              height: loadingSize * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  LoadingAnimationWidget.discreteCircle(
                    color: TBColors.primary,
                    size: 32,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        });
  }

  static hide() {
    Get.back();
  }
}
