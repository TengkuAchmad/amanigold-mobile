import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(100, 30, 30, 33),
              Color.fromARGB(100, 30, 30, 33)
            ], // Sesuaikan dengan warna yang diinginkan
          ),
        ),
        child: ListView(
          children: [
            // SESSION INFO
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.06),
                child: Row(
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/profile.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // END USER PROFILE

                          // USER SESSION INFO
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Pak Hasan Kasuri',
                                style: TextStyle(
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
                          .notifications, // Icon lonceng (bell) untuk notifikasi
                      color: Colors.grey, // Warna ikon putih
                    ),
                  ],
                )),
            // SESSION INFO END

            // CAROUSEL CONTENT
            CarouselSlider(
              items: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: screenWidth * 0.8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Text("Content Carousel",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                )
              ],
              options: CarouselOptions(
                height: screenHeight * 0.2,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 9 / 16,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            // CAROUSEL CONTENT END

            // USER GOLD INFO
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06, vertical: screenWidth * 0.02),
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Jumlah Emas Anda",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "0.001 gram",
                            style: TextStyle(
                              color: Colors.amber,
                              fontFamily: 'SFProDisplay',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "Nilai Emas",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SFProDisplay',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 157, 199, 103),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "12% - Rp 134.120,00 / gram",
                              style: TextStyle(
                                color: Color.fromARGB(255, 98, 153, 9),
                                fontFamily: 'SFProDisplay',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 85,
                      height: 130,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/graph-2.png'),
                              fit: BoxFit.contain)),
                    )
                  ],
                ),
              ),
            ),
            // USER GOLD INFO END

            // GOLD PRICE INFO
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 5, left: screenWidth * 0.06),
              child: const Text(
                "Fluktuasi Harga Emas (by Antam)",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "12% 2120349/gram",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "12% 2120349/gram",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "12% 2120349/gram",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )),
            // GOLD PRICE INFO END

            // FAQ
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 5, left: screenWidth * 0.06),
              child: const Text(
                "Frequently Asked Question",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Bagaimana cara membeli kartu?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Dimana saya dapat menjual kartu ini?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Bagaimana jika kartu saya hilang?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )),
            // FAQ END
          ],
        ),
      ),
    );
  }
}
