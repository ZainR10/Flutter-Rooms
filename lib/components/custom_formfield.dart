import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  const CustomFormField({
    Key? key,
    this.keyboardType,
    this.hintText,
    this.controller,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.white)),
    );
  }
}
