import 'package:flutter/material.dart';
import 'package:nutriscan/Utilities/textFileds.dart';

import '../Utilities/appBar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 130, 51),
      appBar: CustomAppBar("Register"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextFiled("Username", "test"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextFiled("Email", "test"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextFiled("Confirm Password", "test"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Register'),
          ),
        ],
      )),
    );
  }
}
