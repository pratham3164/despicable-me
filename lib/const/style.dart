import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle display1 = TextStyle(
      color: Colors.black,
      fontSize: 35,
      fontWeight: FontWeight.w600,
      fontFamily: 'WorkSpan',
      letterSpacing: 1.2);
  static const TextStyle display2 = TextStyle(
      color: Colors.grey,
      fontSize: 28,
      fontWeight: FontWeight.normal,
      fontFamily: 'WorkSpan',
      letterSpacing: 1.1);
  static final TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    fontFamily: 'WorkSpan',
    letterSpacing: 1.1,
    color: Colors.white.withOpacity(0.8),
  );
  static final TextStyle subheading1 = TextStyle(
      inherit: true,
      fontSize: 25,
      fontWeight: FontWeight.normal,
      fontFamily: 'WorkSpan',
      color: Colors.white.withOpacity(0.8),
      letterSpacing: 1.1);
}
