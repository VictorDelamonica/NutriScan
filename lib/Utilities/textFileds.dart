import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String inputText;

  const CustomTextFiled(this.hint, this.inputText, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        labelText: hint,
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class CustomRoundedText extends StatelessWidget {
  final String _text;

  const CustomRoundedText(this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.black)),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomToggleRoundedButton extends StatefulWidget {
  final String _text;

  const CustomToggleRoundedButton(this._text, {super.key});

  @override
  State<CustomToggleRoundedButton> createState() =>
      _CustomToggleRoundedButtonState();
}

class _CustomToggleRoundedButtonState extends State<CustomToggleRoundedButton> {
  var _color = Colors.white;

  @override
  void initState() {
    super.initState();
    _initializeColor();
  }

  void _initializeColor() {
    DatabaseReference allergyRef = FirebaseDatabase.instanceFor(
      databaseURL: 'https://nutriscan-fbdf8-default-rtdb.europe-west1.firebasedatabase.app',
      app: FirebaseDatabase.instance.app,
    )
        .ref()
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('allergy');

    allergyRef.orderByKey().once().then((event) {
      DataSnapshot snapshot = event.snapshot;
      dynamic values = snapshot.value;
      if (values is Map<dynamic, dynamic>) {
        String key = values.keys.first;
        allergyRef.child(key).child('text').once().then((event) {
          DataSnapshot allergySnapshot = event.snapshot;
          dynamic value = allergySnapshot.value;

          setState(() {
            if (value == widget._text) {
              _color = Colors.green;
            } else {
              _color = Colors.white;
            }
          });
        });
      }
    });
  }

  void _addToDatabase(String text) {
    FirebaseDatabase database = FirebaseDatabase.instanceFor(
        databaseURL:
            'https://nutriscan-fbdf8-default-rtdb.europe-west1.firebasedatabase.app',
        app: FirebaseDatabase.instance.app);
    DatabaseReference _database = database
        .ref()
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child('allergy');
    _database.push().set({'text': text});
  }

  void _removeFromDatabase() {
    FirebaseDatabase database = FirebaseDatabase.instanceFor(
        databaseURL:
            'https://nutriscan-fbdf8-default-rtdb.europe-west1.firebasedatabase.app',
        app: FirebaseDatabase.instance.app);
    DatabaseReference _database = database
        .ref()
        .child('users')
        .child(FirebaseAuth.instance.currentUser!.uid).child('allergy');
    _database.child('/').orderByKey().limitToLast(1).once().then((event) {
      DataSnapshot snapshot = event.snapshot;
      dynamic values = snapshot.value;
      if (values is Map<dynamic, dynamic>) {
        String key = values.keys.first;
        _database.child('/$key').remove();
      }
      return null; // Return a value from the then() callback
    }).catchError((error) {
      print('Une erreur s\'est produite lors de la suppression : $error');
      return null; // Return a value from the catchError() callback
    }, test: (error) => error is FirebaseException);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            if (_color == Colors.green) {
              _removeFromDatabase();
            } else {
              _addToDatabase(widget._text);
            }
            _color = _color == Colors.white ? Colors.green : Colors.white;
          });
        },
        child: Text(
          widget._text,
          style: const TextStyle(color: Colors.black),
        ));
    ;
  }
}
