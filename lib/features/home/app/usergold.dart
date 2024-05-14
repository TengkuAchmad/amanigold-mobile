import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserGold extends StatefulWidget {
  const UserGold({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoldState createState() => _GoldState();
}
class _GoldState extends State<UserGold> with SingleTickerProviderStateMixin{
  late String _goldUser = "0";
  late String _balanceUser = "0";

  @override
  void initState() {
    super.initState();
    _loadGoldData();
    
  }

  Future<void> _loadGoldData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _goldUser = prefs.getString('user_gold') ?? '';
    _balanceUser = prefs.getString('user_balance') ?? '';
    setState(() {});
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
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
                'IDR $_balanceUser',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.amber,
                    size: 16,
                  ),

                   const SizedBox(width: 5),

                  Text(
                     '$_goldUser gram',
                    style: const TextStyle(
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
