import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () async {
                final Uri _url = Uri.parse(
                    'https://658dee2173b2162f1b441d1f--sage-sprinkles-36440e.netlify.app/');
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: const Row(children: [
                  SizedBox(width: 10),
                  Text("Privacy Policy"),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'jerrychen2018@gmail.com',
                  query:
                      'subject=App Feedback&body=App Version 1.0', //add subject and body here
                );

                if (!await canLaunchUrl(params)) {
                  throw Exception('Could not launch $params');
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: const Row(children: [
                  SizedBox(width: 10),
                  Text("Contact Us"),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios_rounded)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//