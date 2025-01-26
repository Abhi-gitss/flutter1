import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Categories"),
        leading: Icon(Icons.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CategoryCard(
              title: "Vitals",
              imageUrl: "assets/vitals.jpg",
              icon: Icons.favorite,
              gradientStart: Colors.teal,
              gradientEnd: Colors.blue,
            ),
            CategoryCard(
              title: "Diet",
              imageUrl: "assets/diet.jpg",
              icon: Icons.local_dining,
              gradientStart: Colors.green,
              gradientEnd: Colors.yellow,
            ),
            CategoryCard(
              title: "Exercise",
              imageUrl: "assets/exersise.jpg",
              icon: Icons.fitness_center,
              gradientStart: Colors.purple,
              gradientEnd: Colors.pink,
            ),
            CategoryCard(
              title: "Women's Health",
              imageUrl: "assets/womens_health.jpg",
              icon: Icons.woman,
              gradientStart: Colors.orange,
              gradientEnd: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final IconData icon;
  final Color gradientStart;
  final Color gradientEnd;

  const CategoryCard({
    required this.title,
    required this.imageUrl,
    required this.icon,
    required this.gradientStart,
    required this.gradientEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gradientStart.withOpacity(0.7), gradientEnd.withOpacity(0.7)],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          // Content (Icon and Title)
          Positioned(
            left: 10,
            bottom: 10,
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
