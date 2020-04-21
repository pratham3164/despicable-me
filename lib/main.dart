import 'package:flutter/material.dart';
import 'package:ui/page/character_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: CharacterList(),
    );
  }
}
