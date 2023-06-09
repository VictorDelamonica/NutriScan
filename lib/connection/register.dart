import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutriscan/Utilities/textFileds.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Pages/Home/home.dart';
import '../Utilities/appBar.dart';
import '../camera/camera.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    try {
      final String user = _usernameController.text.trim();
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(user);
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 130, 51),
      appBar: CustomAppBar("Register", onPressed: () {
        Navigator.pop(context);
      }),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFiled("Username", "test", _usernameController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFiled("Email", "test", _emailController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFiled(
                "Confirm Password", "test", _passwordController),
          ),
          ElevatedButton(
            onPressed: _registerUser,
            child: const Text('Register'),
          ),
        ],
      )),
    );
  }
}
