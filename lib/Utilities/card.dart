import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String _text;
  final IconData _icon;
  final VoidCallback _onPressed;

  const CustomCard(this._text, this._icon, this._onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 600,
          height: 600,
          child: ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.green,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(_text),
                  Icon(_icon, size: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
