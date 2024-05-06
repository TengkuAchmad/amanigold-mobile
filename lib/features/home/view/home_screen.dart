import 'package:flutter/material.dart';
import 'package:myapp/features/home/app/menu.dart';
import 'package:myapp/features/home/app/article.dart';
import 'package:myapp/features/home/app/gold.dart';
import 'package:myapp/features/home/app/usergold.dart';
import 'package:myapp/features/home/app/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // SESSION INFO
            const Profile(),
            // SESSION INFO END

            // USER GOLD INFO
            const UserGold(),
            // USER GOLD INFO END

            // ACTION BUTTON
            const Menu(),
            // ACTION BUTTON END

            // CAROUSEL CONTENT
            const Article(),
            // CAROUSEL CONTENT END


            // GOLD PRICE INFO
           const Gold(),
            // GOLD PRICE INFO END

            // FAQ
            // Padding(
            //   padding:
            //       EdgeInsets.only(top: 25, bottom: 5, left: screenWidth * 0.06),
            //   child: const Text(
            //     "Frequently Asked Question",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: 'SFProDisplay',
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),

            // Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: screenWidth * 0.06,
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: screenWidth,
            //           padding: const EdgeInsets.all(20),
            //           margin: const EdgeInsets.only(top: 5),
            //           decoration: BoxDecoration(
            //               color: Colors.black,
            //               borderRadius: BorderRadius.circular(20)),
            //           child: const Text(
            //             "Bagaimana cara membeli kartu?",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.0,
            //               fontFamily: 'SFProDisplay',
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //         Container(
            //           width: screenWidth,
            //           padding: const EdgeInsets.all(20),
            //           margin: const EdgeInsets.only(top: 5),
            //           decoration: BoxDecoration(
            //               color: Colors.black,
            //               borderRadius: BorderRadius.circular(20)),
            //           child: const Text(
            //             "Dimana saya dapat menjual kartu ini?",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.0,
            //               fontFamily: 'SFProDisplay',
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //         Container(
            //           width: screenWidth,
            //           padding: const EdgeInsets.all(20),
            //           margin: const EdgeInsets.only(top: 5),
            //           decoration: BoxDecoration(
            //               color: Colors.black,
            //               borderRadius: BorderRadius.circular(20)),
            //           child: const Text(
            //             "Bagaimana jika kartu saya hilang?",
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16.0,
            //               fontFamily: 'SFProDisplay',
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //       ],
            //     )),
            // FAQ END
          ],
        ),
      ),
    );
  }
}
