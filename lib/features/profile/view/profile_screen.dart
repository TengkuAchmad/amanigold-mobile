import 'package:flutter/material.dart';
import 'package:myapp/features/profile/app/profile_head.dart';
import 'package:myapp/features/profile/app/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // SESSION INFO
            const ProfileHead(),
            // SESSION INFO END

            const SizedBox(height: 20),

            // MENU
            const ProfileMenu(),
            // MENU END
          ],
        ),
      ),
    );
  }
}
