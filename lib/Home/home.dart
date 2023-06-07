import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriscan/Utilities/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Utilities/appBar.dart';
import '../camera/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User userCredential = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Home", () {SystemNavigator.pop();}),
      body: Center(
        child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: kToolbarHeight),
                    const Text("Home Page"),
                    Text("Welcome ${userCredential.displayName}"),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomButton(
                      "Scan Now",
                      () {
                        availableCameras().then((cameras) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CameraPage(
                                cameras: cameras,
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
