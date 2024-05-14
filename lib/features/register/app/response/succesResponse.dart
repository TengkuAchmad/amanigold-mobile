// PACKAGES
import 'package:flutter/material.dart';
import 'package:myapp/features/login/view/login_screen.dart';

// WIDGETS
class SuccessResponse extends StatefulWidget{
  const SuccessResponse({super.key});

  @override
  State<SuccessResponse> createState() => _SuccessResponseState();
}

class _SuccessResponseState extends State<SuccessResponse> with SingleTickerProviderStateMixin {
  // VARIABLES
  late AnimationController _animationController;
  
  // INITIALIZATION
  @override
  void initState(){
    _animationController = AnimationController(vsync: this, value: 0.33,);
    super.initState();
  }
  // DISPOSE
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  // NAVIGATION
  void navigateScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical:  screenHeight * 0.04),
          child :
          Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: const AssetImage('assets/images/checked.png'), width: screenWidth * 0.3),
                const SizedBox(height: 20,),
                const Text("Registrasi Akun Anda Berhasil!", 
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 60,),

                GestureDetector(
                  onTap: () { navigateScreen();},
                  child: Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: const Center(
                      child: Text(
                      "Coba login",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFProDisplay',
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    )
                    
                  ),
                )
              ],
          )
        ),
      );     
  }
}