// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Gold extends StatefulWidget {
  const Gold({super.key});

  @override
  _GoldState createState() => _GoldState();
}

class _GoldState extends State<Gold> {
  late String _goldSell = "0";
  late String _goldBuy = "0";
  late String _goldDate = "Unknown";

  @override
  void initState() {
    super.initState();
    _loadContentData();
  }

  Future<void> _loadContentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _goldSell = prefs.getInt('gold_sell').toString();
    _goldBuy = prefs.getInt('gold_buy').toString();
    _goldDate = prefs.getString('gold_datetime') ?? "Undefined";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 20,
              bottom: 5,
              left: screenWidth * 0.06,
              right: screenWidth * 0.06),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 21, 21, 21),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.trending_up,
                  color: Colors.green,
                  size: screenHeight * 0.06,
                ),
                const SizedBox(width: 7),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Harga Emas",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFProDisplay',
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Diperbarui : ${_goldDate}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'SFProDisplay',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text('Source', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04,))),
                  DataColumn(label: Text('Sell (Rp)', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04,))),
                  DataColumn(label: Text('Buy (Rp)', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04,))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Row(children: [
                      Image.asset(
                        "assets/images/antam-logo.png",
                        width: 60,
                      )
                    ],)),
                    DataCell(Text(_goldSell, style: TextStyle(color: Colors.amber, fontSize: screenWidth * 0.04))),
                    DataCell(Text(_goldBuy, style: TextStyle(color: Colors.amber, fontSize: screenWidth * 0.04))),
                  ]),
                  // Penambahan DataRow berdasarkan kebutuhan
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
