// PACKAGE
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterForm extends StatefulWidget {
  // DATA VARIABLE
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  // BUTTON VARIABLE
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;

  const RegisterForm({
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
    required this.onLoginPressed,
    required this.onRegisterPressed,
    super.key
  });

  @override
  _RegisterFormState createState() => _RegisterFormState();
}
class _RegisterFormState extends State<RegisterForm> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Register with",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            // GOOGLE BUTTON
            SizedBox(
              height: screenHeight * 0.07,
              width: screenWidth * 0.4,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: Image.asset(
                        'assets/images/google-logo.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const Text(
                      "Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFProDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // FACEBOOK BUTTON
            SizedBox(
              height: screenHeight * 0.07,
              width: screenWidth * 0.4,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/facebook-logo.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const Text(
                      "Facebook",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        const Center(
          child: Text(
            "or",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),

        const SizedBox(height: 15),

         Container(
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 15, 15, 15),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            controller: widget.nameController,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              labelText: "Name",
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: 'SPProDisplay'
              ),
              hintText: "Full Name",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'SPProDisplay'
              ),
              suffixIcon: const Icon(Icons.alternate_email, size: 12),
              focusedBorder:UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

         Container(
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 15, 15, 15),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            controller: widget.phoneController,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              labelText: "Phone",
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: 'SPProDisplay'
              ),
              hintText: "08xxxxxxxxx",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'SPProDisplay'
              ),
              suffixIcon: const Icon(Icons.alternate_email, size: 12),
              focusedBorder:UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        Container(
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 15, 15, 15),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            controller: widget.emailController,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              labelText: "Email",
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: 'SPProDisplay'
              ),
              hintText: "user@gmail.com",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'SPProDisplay'
              ),
              suffixIcon: const Icon(Icons.alternate_email, size: 12),
              focusedBorder:UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

         Container(
          height: 60,
          alignment: Alignment.center,
           decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 15, 15, 15),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            controller: widget.passwordController,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              labelText: "Password",
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: 'SPProDisplay'
              ),
              hintText: "Password",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'SPProDisplay'
              ),
              suffixIcon: const Icon(Icons.remove_red_eye, size: 12),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),

        Container(
          height: 60,
          alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _isLoading = false;
                });
                widget.onRegisterPressed();
              });
            },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            fixedSize: const Size(500, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ), 
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isLoading)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SpinKitCircle(
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                const Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProDisplay'),
                ),
              ],
            ),
        ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sudah punya akun? ",
              style: TextStyle(fontSize: 13, color: Colors.amber),
            ),
            GestureDetector(
              onTap: widget.onLoginPressed,
              child: const Text(
                "Coba Masuk",
                style: TextStyle(color: Colors.amber, fontSize: 13),
              ),
            )
          ],
        ),
      ],
    );
  }
}