import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutriscan/Home/home.dart';
import 'package:nutriscan/Utilities/textFileds.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Utilities/appBar.dart';
import '../camera/camera.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        availableCameras().then((cameras) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        });
      }
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
      },),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFiled("Email", "test", _emailController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFiled("Confirm Password", "test", _passwordController),
              ),
              ElevatedButton(
                onPressed: _loginUser,
                child: const Text('Login'),
              ),
            ],
          )),
    );
  }
}
