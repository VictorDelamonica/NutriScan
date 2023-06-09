import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriscan/Utilities/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutriscan/Utilities/card.dart';

import '../../Utilities/appBar.dart';
import '../../camera/camera.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("About", onPressed: () {
        Navigator.pop(context);
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Developed by: Victor Delamonica'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image(
                    image: Image.asset("assets/images/github.png").image,
                    width: 20,
                    height: 20),
                const Text(" => https://github.com/VictorDelamonica")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
