import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  var title = "Lorem Ipsum";

  final VoidCallback _onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  CustomAppBar(this.title, this._onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 130, 51),
        elevation: 0,
        leading: IconButton(
          onPressed: _onPressed,
          icon: const Icon(Icons.arrow_back),
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
