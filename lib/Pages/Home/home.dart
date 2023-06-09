import 'package:camera/camera.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriscan/Pages/Profile/profile.dart';
import 'package:nutriscan/Utilities/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutriscan/Utilities/card.dart';

import '../About/about.dart';
import '../../Utilities/appBar.dart';
import '../../camera/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User userCredential = FirebaseAuth.instance.currentUser!;
  final DatabaseReference _reference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Home", icon: Icons.logout, onPressed: () {
        FirebaseAuth.instance.signOut();
        SystemNavigator.pop();
      }),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        children: [
                          CustomCard("Scan Now", Icons.camera_alt, () {
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
                          }),
                          CustomCard("Profile", Icons.person_outline,() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          }),
                          CustomCard("Settings", Icons.settings,() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }),
                          CustomCard("About", Icons.question_mark,() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutPage(),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
