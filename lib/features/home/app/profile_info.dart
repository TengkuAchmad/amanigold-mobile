import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late String _name;
  late String _photo;
  late String _userName = '';

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _photo = prefs.getString('photo') ?? '';
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
          margin: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              // USER PROFILE
              Container(
                margin: const EdgeInsets.only(right: 5.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _photo == 'default' 
                    ? const AssetImage('assets/images/profile.png')
                    : NetworkImage(_photo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // END USER PROFILE

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