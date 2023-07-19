import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final Icon prefixIcon;
  final String text;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const TextFieldCustom({
    super.key,
    required this.prefixIcon,
    required this.text,
    this.obscureText = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: text,
            filled: true,
            fillColor: Colors.grey[900],
            focusColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            )));
  }
}
