import 'package:flutter/material.dart';
import 'package:myapp/features/home/app/menu.dart';
import 'package:myapp/features/home/app/article.dart';
import 'package:myapp/features/home/app/gold.dart';
import 'package:myapp/features/profile/app/profile_head.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // SESSION INFO
            const ProfileHead(),
            // SESSION INFO END
          ],
        ),
      ),
    );
  }
}
