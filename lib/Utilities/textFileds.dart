import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String inputText;

  const CustomTextFiled(this.hint, this.inputText, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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

class CustomRoundedText extends StatelessWidget {

  final String _text;

  const CustomRoundedText(this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.black)),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomToggleRoundedButton extends StatefulWidget {
  final String _text;

  const CustomToggleRoundedButton(this._text, {super.key});

  @override
  State<CustomToggleRoundedButton> createState() => _CustomToggleRoundedButtonState();
}

class _CustomToggleRoundedButtonState extends State<CustomToggleRoundedButton> {

  var _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(_color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Colors.black),
        ),
      ),
    ),onPressed: () {
      setState(() {
      _color = _color == Colors.white ? Colors.green : Colors.white;
      });
    }, child: Text(widget._text, style: const TextStyle(color: Colors.black),));;
  }
}
