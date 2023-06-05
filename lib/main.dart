import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Utilities/buttons.dart';
import 'camera/camera.dart';
import 'connection/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 130, 51),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Image(
                    image: AssetImage("./assets/images/logo.png"),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3 - 28.0 - kToolbarHeight - 8.0 * 4 - 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton("Register Now", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: InvertedButton("Login", () {
                  if (kDebugMode) {
                    print("Button 1 Pressed!");
                  }
                }),
              ),
              TextButton(
                onPressed: () async {
                  await availableCameras().then((cameras) {
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
                child: const Text(
                  "Try without login",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
