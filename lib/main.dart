import 'package:flutter/material.dart';
import 'package:flutter_application_1/act1-mid/design_typing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(ProviderScope(child: TypingApp()));
  }

class TypingApp extends StatelessWidget {
  const TypingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TypingScreen(),
    );
  }
}
