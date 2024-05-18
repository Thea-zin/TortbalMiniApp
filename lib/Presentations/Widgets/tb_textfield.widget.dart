import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thortbal/Constants/tb_textsize.dart';

// ignore: must_be_immutable
class TBTextFeild extends StatelessWidget {
  TBTextFeild({
    super.key,
    this.controller,
    this.width = double.infinity,
    this.maxWidthPrefix = 48,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.hinText = "Placeholder",
    this.focusNode,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
  });

  TextEditingController? controller;
  double width;
  Widget? prefix;
  Widget? suffix;
  String hinText;
  FocusNode? focusNode;
  double maxWidthPrefix;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  bool readOnly;
  bool obscureText;
  InputBorder? errorBorder;
  void Function(String)? onChanged;
  void Function()? onTap;
  void Function(PointerDownEvent)? onTapOutside;
  void Function(String)? onFieldSubmitted;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;

  // private property
  final double _subWidgetContraint = 24.0;
  final double _radius = 12.0;
  final double _contentPadding = 16.0;
  final Color _backgroundColor = const Color.fromRGBO(245, 245, 245, 1);

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        focusNode: focusNode,
        onChanged: onChanged,
        onTapOutside: onTapOutside,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        obscureText: obscureText,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
          errorBorder: errorBorder,
          prefixIcon: prefix,
          prefixIconConstraints: BoxConstraints(
            maxHeight: _subWidgetContraint,
            minHeight: _subWidgetContraint,
            minWidth: _subWidgetContraint,
            maxWidth: maxWidthPrefix,
          ),
          suffixIcon: suffix,
          suffixIconConstraints: BoxConstraints(
            maxHeight: _subWidgetContraint,
            minHeight: _subWidgetContraint,
            minWidth: _subWidgetContraint,
            maxWidth: 48,
          ),
          // suffix: ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide.none,
          ),
          constraints: const BoxConstraints(
            minHeight: 48,
            maxHeight: 48,
            maxWidth: double.infinity,
          ),
          filled: true,
          fillColor: _backgroundColor,
          hintText: hinText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: TBTextSize.large,
          ),
          focusedBorder: null,
          enabledBorder: null,
          contentPadding: EdgeInsets.symmetric(horizontal: _contentPadding),
        ),
      ),
    );
  }
}
