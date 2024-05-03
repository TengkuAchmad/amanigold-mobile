import 'package:flutter/material.dart';
// import 'package:myapp/features/splashscreen/view/splash_screen.dart';
import 'package:myapp/global/utils/google/google_samples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      );
  }
}