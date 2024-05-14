// ignore_for_file: use_build_context_synchronously

// PACKAGE
import 'package:flutter/material.dart';
import 'package:myapp/features/login/api/login_req.dart';
import 'package:myapp/features/login/app/input/login_form.dart';
import 'package:myapp/features/register/view/register_screen.dart';
import 'package:myapp/global/layouts/main_layout.dart';
import 'package:myapp/global/provider/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool isError = false;

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.08 , horizontal: screenWidth * 0.06),
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoginForm(
              emailController: emailController, 
              passwordController: passwordController, 
              rememberMe: rememberMe, 
              isError: isError,
              onRememberMeChanged: (value) {
                setState(() {
                  rememberMe = value;
                });
              }, 
              onLoginPressed: () async {
                final bool success = await LoginReq().loginRequest(context, emailController.text, passwordController.text);
                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const DataService()),
                  );
                } else {
                  setState(() {
                    isError = !success;
                  });
                }
              }, 

              onRegisterPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              } )
          ],
        ),
        ]
      ),
    );
  }

}
