import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuState createState() => _MenuState();
}
class _MenuState extends State<Menu> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    
  }

@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

   return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06, vertical: screenWidth * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 21, 21),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: 
            const Icon(
              Icons.import_export_rounded, 
              color: Colors.white,
              size: 25
            ),
        ),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 21, 21),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: 
            const Icon(
              Icons.insights_rounded, 
              color: Colors.white,
              size: 25
            ),
        ),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 21, 21),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: 
            const Icon(
              Icons.discount_rounded, 
              color: Colors.white,
              size: 25
            ),
        ),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 21, 21),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: 
            const Icon(
              Icons.credit_card_rounded, 
              color: Colors.white,
              size: 25
            ),
        ),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 21, 21),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: 
            const Icon(
              Icons.qr_code_scanner_rounded, 
              color: Colors.white,
              size: 25
            ),
        ),

      ],
    )
  );
}
}
