import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  var hint = "test";
  var inputText;

  CustomTextFiled(this.hint, this.inputText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green), borderRadius: BorderRadius.all(Radius.circular(25))),
        labelText: "hint",
        labelStyle: TextStyle(
          color: Colors.green,
        ),
      ),);
  }
}
