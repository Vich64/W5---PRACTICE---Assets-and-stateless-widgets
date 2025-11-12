import 'package:flutter/material.dart';

enum Product {
  dart('Dart', 'Made my life miser', '../assets/Ex3/dart.png'),
  flutter(
    'Flutter',
    'The best mobile widget library',
    '../assets/Ex3/flutter.png',
  ),
  firebase('Firebase', 'The best cloud database', '../assets/Ex3/firebase.png');

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2196F3),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCard(product: Product.dart),
                SizedBox(height: 20),
                CustomCard(product: Product.flutter),
                SizedBox(height: 20),
                CustomCard(product: Product.firebase),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  const CustomCard({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Blue header with image
          Container(
            height: 140,
            width: double.infinity,
            color: Color.fromARGB(255, 255, 255, 255),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Image.asset(
              product.imagePath,
              height: 100,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 50, color: Colors.white);
              },
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
