import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1DV355 Project', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            Text('This is a mobile app developed for the Introduction to App Development with Flutter course at Linnaeus University.'),
            SizedBox(height: 20),
            Text('Developed by Erdem Halil'),
          ],
        ),
      ),
    );
  }
}