import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/usergold_data.dart';

class UserGold extends StatefulWidget {
  const UserGold({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoldState createState() => _GoldState();
}
class _GoldState extends State<UserGold> with SingleTickerProviderStateMixin{
  List<Map<String, dynamic>> _goldData = [];

  @override
  void initState() {
    super.initState();
    _loadContentData();
    
  }

  Future<void> _loadContentData() async {
    // ignore: use_build_context_synchronously
    List<Map<String, dynamic>>? goldData = await UserGoldData().getGoldPrefs(context);

    if (goldData != null) {
      setState(() {
        _goldData = goldData;
      });
    }
  }

@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

   return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06, vertical: screenWidth * 0.02),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 94, 12, 149),
              Color.fromARGB(255, 146, 30, 134),
              Color.fromARGB(255, 216, 121, 216),
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Balance",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SFProDisplay',
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "IDR 120.300",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.amber,
                    size: 16,
                  ),

                   SizedBox(width: 5),

                  Text(
                    "0.1 gram",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFProDisplay',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
}
