import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriscan/Utilities/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutriscan/Utilities/card.dart';

import '../../Utilities/appBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Profile", onPressed: () {
        Navigator.pop(context);
      }),
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
