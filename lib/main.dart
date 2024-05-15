import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: "Instagram Clone",
      debugShowCheckedModeBanner: false,
      home: Home(),
      
    );
  }
}
