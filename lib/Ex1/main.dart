import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Ex',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            boxWidget(
              color: Colors.green,
              text: 'I play this game before',
              iconData: Icons.travel_explore,
            ),
            boxWidget(
              color: Colors.red,
              text: 'It over Anakin',
              iconData: Icons.star,
            ),
            boxWidget(
              color: Colors.purple,
              text: 'I have the high ground',
              iconData: Icons.landscape,
            ),
          ],
        ),
      ),
    );
  }
}

class boxWidget extends StatelessWidget {
  final Color color;
  final String text;
  final IconData iconData;
  const boxWidget({
    super.key,
    required this.color,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 50,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          spacing: 20,
          children: [
            Icon(iconData, size: 50),
            Text(
              text,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
