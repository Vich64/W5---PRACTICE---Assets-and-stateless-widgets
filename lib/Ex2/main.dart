import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 129, 188, 251),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const HobbyCard(
                  color: Color.fromARGB(255, 37, 197, 58),
                  icon: Icons.book,
                  label: 'Learning Dart With Ronan',
                ),
                const SizedBox(height: 10),
                const HobbyCard(
                  color: Color.fromARGB(255, 21, 69, 140),
                  icon: Icons.movie,
                  label: 'Movies',
                ),
                const SizedBox(height: 10),
                const HobbyCard(icon: Icons.directions_bike, label: 'Cycling'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    this.color = Colors.blue,
    required this.icon,
    required this.label,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Icon(icon, size: 50, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
