import 'package:flutter/material.dart';
import 'package:myapp/features/splashscreen/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileMenuState createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context, 
      MaterialPageRoute(builder: (context) => const SplashScreen()), 
      (route) => false);
  }

  @override
  Widget build(BuildContext context){
  final screenWidth = MediaQuery.of(context).size.width;
  // final screenHeight = MediaQuery.of(context).size.height;

  return 
  Container(
    padding: EdgeInsets.symmetric(horizontal:  screenWidth * 0.04),
    child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                    Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 21, 21),
              borderRadius: BorderRadius.circular(10),
            ),
            child: 
              const Row(
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Notifikasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              )
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 21, 21),
              borderRadius: BorderRadius.circular(10),
            ),
            child: 
              const Row(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Bagikan",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              )
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 21, 21),
              borderRadius: BorderRadius.circular(10),
            ),
            child: 
              const Row(
                children: [
                  Icon(
                    Icons.help_outline_outlined,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Pusat Bantuan",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              )
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () { _logout();},
            child: 
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: 
                  const Row(
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Keluar",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SFProDisplay',
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  )
              ),
          )

          
        ],
      )
    );
  }
}