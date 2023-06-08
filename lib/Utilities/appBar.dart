import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  var title = "Lorem Ipsum";
  var _icon = Icons.arrow_back;

  final VoidCallback _onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  CustomAppBar(this.title, {IconData? icon, required VoidCallback onPressed, Key? key})
      : _icon = icon ?? Icons.arrow_back,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 130, 51),
        elevation: 0,
        leading: IconButton(
          onPressed: _onPressed,
          icon: Icon(_icon),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
