import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'dashboard.dart';
import 'community.dart';
import 'car_page.dart';
import 'car_puncture.dart'; // Import CarPuncturePage
import 'car_engineoil.dart'; // Import CarEngineOilPage
import 'jump_start.dart'; // Import JumpStartPage
import 'bike_page.dart'; // ✅ Import BikePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vlify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Start with HomePage
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/community': (context) => CommunityPage(),
        '/cars': (context) => CarPage(),
        '/car_puncture': (context) => CarPuncturePage(),
        '/car_engineoil': (context) => CarEngineOilPage(),
        '/jump_start': (context) => JumpStartPage(),
        '/bikes': (context) => BikePage(), // ✅ Added BikePage route
      },
    );
  }
}
