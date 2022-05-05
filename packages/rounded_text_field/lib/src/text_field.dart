import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  final String hintText;
  final bool? filled;
  final Color? fillColor;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? radius;
  final double? hintTextSize;
  const RoundedTextField({Key? key, required this.hintText, this.filled, this.fillColor, this.hintTextColor, this.borderColor, this.radius, this.hintTextSize}) : super(key: key);

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? Color(0XFFE8EEF3),
        filled: widget.filled ?? true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0XFF70707059)),
          borderRadius: BorderRadius.circular(widget.radius ?? 7),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintTextColor ?? Color(0XFF6D6D6D), fontSize: widget.hintTextSize ?? 14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0XFF70707059)),
          borderRadius: BorderRadius.circular(widget.radius ?? 7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0XFF70707059)),
          borderRadius: BorderRadius.circular(widget.radius ?? 7),
        ),
      ),
    );
  }
}
