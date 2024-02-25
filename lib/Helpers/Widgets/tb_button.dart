import 'package:flutter/material.dart';
import 'package:thortbal/Constants/tb_color.dart';

class TBButton extends StatelessWidget {
  const TBButton({
    required this.child,
    this.width = double.infinity,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.alignment,
    super.key,
  });

  final double width;
  final Widget child;
  final Color? backgroundColor;
  final void Function()? onTap;
  final double? elevation;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 48),
        maximumSize: Size(width, 48),
        minimumSize: Size(width, 48),
        backgroundColor: backgroundColor ?? TBColor.primary,
        elevation: elevation ?? 4,
        alignment: alignment ?? Alignment.center,
      ),
      child: child,
    );
  }
}

class TBBackButton extends StatelessWidget {
  const TBBackButton({
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    super.key,
  });

  final void Function() onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  final double _padding = 12.0;
  final double _buttonSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(_padding),
        backgroundColor: backgroundColor ?? TBColor.secondary,
        elevation: 0,
        alignment: Alignment.center,
      ),
      child: Icon(
        Icons.arrow_back_ios_rounded,
        size: _buttonSize,
        color: iconColor ?? TBColor.primary,
      ),
    );
  }
}
