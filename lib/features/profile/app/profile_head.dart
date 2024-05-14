import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileHead extends StatefulWidget {
  const ProfileHead({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileHeadState createState() => _ProfileHeadState();
}

class _ProfileHeadState extends State<ProfileHead> {
  late String _name = "";
  late String _photo = "default";
  late String _email = "";
  late String _userName = '';
  late String _goldUser = "0";
  late String _balanceUser = "0";

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _photo = prefs.getString('photo') ?? '';
    _email = prefs.getString('email') ?? '';
    _goldUser = prefs.getString('user_gold') ?? '';
    _balanceUser = prefs.getString('user_balance') ?? '';
    _userName = _name.split(' ').take(2).join(' ');
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Container(
    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal:  screenWidth * 0.04),
    child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children :[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // GOLD DATA
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 21, 21, 21),
                      ),
                      child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _goldUser,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          ],
                        )
                    ),
                    // GOLD DATA END
      
                    const SizedBox(width: 10),
      
                    // BALANCE DATA
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 21, 21, 21),
                      ),
                      child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          const Icon(
                            Icons.wallet_rounded,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'IDR $_balanceUser',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
      
                          ],
                        )
                    ),
                    // BALANCE DATA END
      
                    const SizedBox(width: 10),
                    
                    const Icon(Icons.settings_outlined, color: Colors.white,)
                  ],
                ),
      
                const SizedBox(height: 20),
      
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: Image(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,)
                      
                    )
                  ],
                ),
      
                const SizedBox(height: 10),
      
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _email,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      _userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ]
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(60)
                      ),
                      child: 
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.amber,
                            size: 15,
                          ),

                          SizedBox(width: 10),  

                          Text(
                            "Ubah profil",
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SFProDisplay',
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          )

                        ],
                      )
                    )
                  ],
                )            
              ] 
            ),
          )
        ],
      )  
    );
  }
}