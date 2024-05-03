// PACKAGE
import 'package:flutter/material.dart';
import 'package:myapp/features/login/view/login_screen.dart';
import 'package:myapp/features/register/api/register_req.dart';
import 'package:myapp/features/register/app/input/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
            RegisterForm(
              emailController: emailController, 
              passwordController: passwordController,
              nameController: nameController,
              phoneController: phoneController,
              isError: isError,
              onRegisterPressed: () async {
               final bool success = await RegisterReg().registerRequest(context, emailController.text, passwordController.text, nameController.text, phoneController.text);
                setState(() {
                  isError = !success;
                });
              },

              onLoginPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              } )
          ],
        ),
        ]
      ),
    );
  }

}
