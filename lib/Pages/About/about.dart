import 'package:flutter/material.dart';
import 'package:nutriscan/Utilities/card.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Utilities/appBar.dart';

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
                          CustomCard("GitHub", Icons.code, () {
                            const url = "https://github.com/VictorDelamonica";
                            launchUrlString(url);
                          }),
                          CustomCard("LinkedIn", Icons.work, () {
                            const url = "https://www.linkedin.com/in/victor-delamonica/";
                            launchUrlString(url);
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

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Impossible de lancer $url';
  }
}
