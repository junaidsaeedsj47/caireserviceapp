import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CarieTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Widget suffix;
  final Widget? prefixIcon;

  // ValueChanged<String> onChanged;
  final TextEditingController controller;

  const CarieTextField({

    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.suffix = const SizedBox(
      height: 0,
      width: 0,
    ),
    this.hintText = "", this.prefixIcon,
    // this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xffB4B4B4)),
        focusColor: Colors.transparent,
        suffix: suffix,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffB4B4B4)),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE7E8EE), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE7E8EE), width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }
}

class CarieTextFieldWithoutLabel extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final bool obscureText;
  final Widget suffix;
  final Widget prefix;
  final Widget? prefixIcon;
  final String? errorText;
  final bool filled;
  final Color enableBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final EdgeInsetsGeometry contentPadding;

  // ValueChanged<String> onChanged;
  final TextEditingController controller;

  const CarieTextFieldWithoutLabel({
    required this.controller,
    this.obscureText = false,
    this.contentPadding =
    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
    this.suffix = const SizedBox(
      height: 0,
      width: 0,
    ),
    this.hintText = "",
    this.hintStyle = const TextStyle(color: Color(0xffB4B4B4)),
    this.prefix = const SizedBox(
      height: 0,
      width: 0,
    ),
    this.filled = false,
    this.fillColor = Colors.transparent,
    this.enableBorderColor = const Color(0xffE7E8EE),
    this.focusedBorderColor = const Color(0xffE7E8EE),   this.errorText, this.prefixIcon,
    // this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color(0xffB4B4B4)),
        focusColor: Colors.transparent,
        suffix: suffix,
        prefix: prefix,
        prefixIcon: prefixIcon,
        errorText: errorText,
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enableBorderColor, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1.8),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }
}
