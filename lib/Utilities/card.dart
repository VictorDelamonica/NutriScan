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
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          width: 600,
          height: 600,
          child: ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
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

class CustomRoundedRectangle extends StatelessWidget {
  final double width;
  final double height;
  final Color colorHeader;
  final Color color;
  final double borderRadius;
  final Widget child;

  const CustomRoundedRectangle({
    super.key,
    required this.width,
    required this.height,
    required this.colorHeader,
    required this.color,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
        Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            color: colorHeader,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
        )
      ],
    );
  }
}
