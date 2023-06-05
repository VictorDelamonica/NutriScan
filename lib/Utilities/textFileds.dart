import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hint;
  final String inputText;

  const CustomTextFiled(this.hint, this.inputText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        labelText: hint,
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
