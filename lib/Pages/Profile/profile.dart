import 'dart:async';

import 'package:camera/camera.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriscan/Utilities/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutriscan/Utilities/card.dart';
import 'package:nutriscan/Utilities/textFileds.dart';

import '../../Utilities/appBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User userCredential = FirebaseAuth.instance.currentUser!;

  Future<void> _addAllergy(String allergy) async {
    try {
      FirebaseDatabase database = FirebaseDatabase.instanceFor(databaseURL: 'https://nutriscan-fbdf8-default-rtdb.europe-west1.firebasedatabase.app', app: FirebaseDatabase.instance.app);
      DatabaseReference userRef = database.ref().child("users").child(FirebaseAuth.instance.currentUser!.uid);
      userRef.set({'allergy': allergy});
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Profile", onPressed: () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomRoundedRectangle(
                    width: double.maxFinite,
                    height: 250,
                    color: Colors.black12,
                    colorHeader: Colors.black26,
                    borderRadius: 20,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Information",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomRoundedText(
                                    "${userCredential.displayName}"),
                                const SizedBox(height: 10),
                                CustomRoundedText("${userCredential.email}"),
                                const SizedBox(height: 10),
                                const CustomRoundedText("********"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomRoundedRectangle(
                      width: double.maxFinite,
                      height: 400,
                      colorHeader: Colors.black26,
                      color: Colors.black12,
                      borderRadius: 20,
                      child: Column(
                        children: [
                          const Align(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Allergy", style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.0,
                                ),
                                children: [
                                  CustomToggleRoundedButton("Milk"),
                                  CustomToggleRoundedButton("Egg"),
                                  CustomToggleRoundedButton("Fish"),
                                  CustomToggleRoundedButton("Crustacean"),
                                  CustomToggleRoundedButton("Tree Nuts"),
                                  CustomToggleRoundedButton("Peanuts"),
                                  CustomToggleRoundedButton("Wheat"),
                                  CustomToggleRoundedButton("Soybeans"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
