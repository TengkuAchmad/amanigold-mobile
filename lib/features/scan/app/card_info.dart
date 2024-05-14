import 'package:flutter/material.dart';
import 'package:myapp/global/layouts/main_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardInfo extends StatefulWidget {
  const CardInfo({super.key});

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo>{
  late String _seri = "";
  late String _form = "";
  late String _fineness = "";
  late String _weight = "";
  late String _owner = "";

  @override
  void initState() {
    super.initState();
    _fetchCardData();
  }

  Future<void> _fetchCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seri = prefs.getString('seri_kartu') ?? '';
    _form = prefs.getString('form_kartu') ?? '';
    _fineness = prefs.getString('fineness_kartu') ?? '';
    _weight = prefs.getString('weight_kartu') ?? '';
    _owner = prefs.getString('owner_kartu') ?? '';
    setState(() {});
  }
  
  void navigateScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainLayout())
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04),
          child: Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                    
                    const SizedBox(width: 7),

                    Text(
                      "Identitas Kartu Valid",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: screenWidth * 0.04,
                      ),
                    )
                  ],
                ),
                
                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Selalu cek keaslian kartu emas Anda",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Colors.grey,
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 2),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "melalui kode QR yang tertera di belakang kartu.",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Colors.grey,
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),

                 Container(
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Identitas Pemilik",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          _owner,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Seri kartu",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          _seri,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Berat Emas",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          '$_weight gram',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Bentuk",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          _form,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  width: screenWidth,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Kemurnian",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          _fineness,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SFProDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                ),

                GestureDetector(
                  onTap: (() {
                    navigateScreen();
                  }),
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: screenWidth,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: 
                    const Text(
                      "Kembali",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFProDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                )
                
              ],
            )
          ),
        ),
      ),
    );
  }
}

