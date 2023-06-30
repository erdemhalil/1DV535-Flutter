import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person Information',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PersonInfoPage(),
    );
  }
}

class PersonInfoPage extends StatelessWidget {
  const PersonInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Person Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/me.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Erdem Halil',
                style: GoogleFonts.dancingScript(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('erdem-2001@windowslive.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('+46 724-038-383'),
              ),
              const ListTile(
                leading: Icon(Icons.web),
                title: Text('Website'),
                subtitle: Text('www.github.com/erdemhalil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
