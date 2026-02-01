import 'package:flutter/material.dart';
import 'package:live_class_project/home_screen.dart';

void main() {
  runApp(GoogleMapsDemo());
}

class GoogleMapsDemo extends StatelessWidget {
  const GoogleMapsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
