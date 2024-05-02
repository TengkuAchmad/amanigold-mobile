// PACKAGES
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Cardcarousel extends StatefulWidget {
  const Cardcarousel({super.key});

  @override
  State<Cardcarousel> createState() => _CardcarouselState();
}

class _CardcarouselState extends State<Cardcarousel> with SingleTickerProviderStateMixin {
  
  // VARIABLES
  // ignore: unused_field
  int _currentImageIndex    = 0;
  late AnimationController _animationController;

  // INITIALIZATION
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, value: 0.33,);
    super.initState();
  }

  // DISPOSE
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // CAROUSEL ITEMS
    List<String> imagePaths = [
      'assets/images/card-1.png',
      'assets/images/card-2.png',
      'assets/images/card-3.png',
      'assets/images/card-4.png',
      'assets/images/card-5.png',
      'assets/images/card-6.png',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        CarouselSlider(
          items: imagePaths.map((String imagePath) {
            return Container(
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
              ),
            );
          }).toList(),

          options: CarouselOptions(
            height: screenHeight * 0.4,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.58,
            onPageChanged: (index, reason){
              setState(() {
                _currentImageIndex = index;
              });
            }),
        ),

        const SizedBox(height: 20),

         Container(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: imagePaths
                  .asMap()
                  .entries
                  .map((MapEntry<int, String> entry) {
                int index = entry.key;
                return AnimatedContainer(
                  duration:
                      const Duration(milliseconds: 300),
                  width: _currentImageIndex == index ? 30.0 : 10.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: _currentImageIndex == index
                        ? BorderRadius.circular(
                            5.0) 
                        : BorderRadius.circular(
                            50), 
                    color: _currentImageIndex == index
                        ? Colors.amber
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}