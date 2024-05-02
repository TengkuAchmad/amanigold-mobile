// PACKAGES
import 'package:flutter/material.dart';
import 'package:myapp/features/register/view/register_screen.dart';

// WIDGETS
import 'package:myapp/features/splashscreen/widget/card_carousel.dart';
import 'package:myapp/features/login/view/login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  // VARIABLES
  bool _isButtonClicked = false;
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
      MaterialPageRoute(builder: (_) => const SplashScreen()));
  }

  // BUTTON HANDLER
  void startProgress() {
    setState(() {
      _isButtonClicked = true;
    });
    _animationController.animateTo(0.66, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          
              // PROGRESS BAR
              LinearProgressIndicator(
                value: _isButtonClicked ? 0.66 : _animationController.value,
                semanticsLabel: 'Progress Screen',
                backgroundColor: Colors.white10,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
                minHeight: 5,
              ),
              // PROGRESS BAR
          
              // HEADERS
              Container(
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03, horizontal: screenWidth * 0.03),
                width: screenWidth * 0.34,
                height: screenHeight * 0.04,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/Logo-long.png'),
                  fit: BoxFit.fill)
                ),
              ),
              // HEADERS
          
              const Cardcarousel(),
          
              // FIRST PAGE
              if (!_isButtonClicked)
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03,
                    horizontal: screenWidth * 0.04
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      // PREFACE
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kartu Emas,",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                              fontSize: screenHeight * 0.04,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                          Text(
                            "Souvenirs & Gifts",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SFProDisplay',
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Precious metals and minerals for your gift and souvenirs in a card.",
                            style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'SFProDisplay',
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ],
                      ),
          
                      const SizedBox(height: 20),
          
                      SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.06,
                        child: ElevatedButton(
                          onPressed: startProgress,
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
                            foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                          ),
          
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                
              if (_isButtonClicked)
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03,
                    horizontal: screenWidth * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Apakah Anda sudah memiliki akun?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.04,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Ini akan membantu Anda untuk mengakses fitur lainnya pada apikasi.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'SFProDisplay',
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
          
                    const SizedBox(height: 10),
          
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterScreen()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
                          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                        ),
                        child: const Text(
                          "Buat Akun Baru",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
          
          
                    const SizedBox(height: 15),
          
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: (() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen())
                          );
                        }),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(
                                  Colors.black),
                          shape: WidgetStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: WidgetStateProperty.all<
                              EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        ),
                        child: const Text(
                          "Saya sudah memiliki akun",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}