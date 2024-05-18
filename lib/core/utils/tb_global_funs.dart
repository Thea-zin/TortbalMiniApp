import 'dart:io';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

showTBBottomSheet({
  required BuildContext context,
  required Widget child,
  bool isDismissible = false,
  bool enableDrag = false,
  Color barierColor = Colors.black45,
}) {
  if (Platform.isIOS) {
    showCupertinoModalBottomSheet(
        overlayStyle: SystemUiOverlayStyle.light,
        barrierColor: Colors.black45,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        context: context,
        builder: (context) {
          return child;
        });
  } else {
    showModalBottomSheet(
        barrierColor: Colors.black45,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        context: context,
        builder: (context) {
          return child;
        });
  }
}
