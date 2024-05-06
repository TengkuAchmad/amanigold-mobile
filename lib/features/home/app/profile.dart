import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String _name;
  late String _userName = '';

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _userName = _name.split(' ').take(2).join(' ');
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: screenHeight * 0.02,
      horizontal: screenWidth * 0.04
    ),
    child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
             children: [
              // USER SESSION INFO
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      _userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              // END USER SESSION INFO
            ],
          ),
        ),
        const Icon(
          Icons
              .notifications_outlined, 
          color: Colors.grey,
        ),
      ],
    ),
  );
  }
}