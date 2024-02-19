
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTFF extends StatelessWidget {
  const CustomTFF({
    super.key,
    this.hintstyle,
    this.controller,
    this.label,
    this.initialValue,
    this.keyBoardType,
    this.inputFormatters,
    this.hint,
    this.borderType,
    this.borderSize = 1,
    this.borderColor = const Color(0XFFC2C2C2),
    this.boxHeight,
    this.onChanged,
    this.isObscure = false,
    this.maxLines,
    this.minLines,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.decoration,
    this.prefixIcon,
    this.cursorHeight,
    this.cursorColor,
    this.isHidden,
    this.onTap,
    this.contentPaddingHeight,
    this.suffixIconConstraints,
    this.readOnly,
    this.Errortext,
    this.validator, required this.fieldName,
  });
  final TextStyle? hintstyle;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final String? initialValue;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? borderType;
  final double borderSize;
  final Color borderColor;
  final double? boxHeight;
  final Function(String)? onChanged;
  final bool isObscure;
  final int? maxLines;
  final int? minLines;
  final double? contentPaddingHeight;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isHidden;
  final bool? readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final InputDecoration? decoration;
  final Function()? onTap;
  final Color? cursorColor;
  final String fieldName;
  final double? cursorHeight;
  final BoxConstraints? suffixIconConstraints;
  final String? Errortext;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                  SizedBox(
                    height: 24,
                  ),
        Text( fieldName ),
        SizedBox(
                    height: 6,
                  ),
        Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          validator: validator,
          controller: controller,
          cursorHeight: cursorHeight,
          cursorColor: cursorColor,
          initialValue: initialValue,
          keyboardType: keyBoardType,
          onTap: onTap ?? () {},
          readOnly: readOnly ?? false,
          style: TextStyle(fontSize: 18),
          onChanged: onChanged,
          obscureText: isObscure,
          inputFormatters: inputFormatters,
          decoration: decoration ??
              InputDecoration(
                errorText: Errortext,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                suffixIconConstraints: suffixIconConstraints,
                suffix: suffix,
                prefix: prefix,
                isDense: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintText: hint,
                hintStyle: TextStyle(fontSize: 18),
                labelText: label,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                      width: borderSize, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(width: borderSize, color: borderColor),
                ),
                alignLabelWithHint: true,
              ),
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          minLines: minLines,
        ),
      ),
    ) ]);
  }
}
