import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileHead extends StatefulWidget {
  const ProfileHead({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileHeadState createState() => _ProfileHeadState();
}

class _ProfileHeadState extends State<ProfileHead> {
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

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.4,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
          child:  const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children :[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "<-",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  
                  Icon(Icons.settings, color: Colors.white,)
                ],
              ),

              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Image(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,)
                    
                  )
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "James Martin",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ]
              )

              
            ] 
          ),
        )
      ],
    ),
  );
  }
}