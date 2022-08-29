import 'package:flutter/material.dart';
import 'package:sd22/models/recommended_model.dart';
import 'package:sd22/screens/home_screen.dart';
import 'package:sd22/screens/selected_place_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectedPlaceScreen(
      ),
    );
  }
}
