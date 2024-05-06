import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/usergold_data.dart';

class Gold extends StatefulWidget {
  const Gold({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoldState createState() => _GoldState();
}
class _GoldState extends State<Gold> with SingleTickerProviderStateMixin{
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
  final screenHeight = MediaQuery.of(context).size.height;

   return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:
          EdgeInsets.only(top: 20, bottom: 5, left: screenWidth * 0.06, right: screenWidth * 0.06),
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
                offset: Offset(0,3),
              )
            ]
          ),
          child:
          const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              Icons.trending_up,
              color: Colors.green,
              size: 45.0,
            ),

            SizedBox(width: 7),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                "Harga Emas",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFProDisplay',
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Diperbarui : 06/05/24",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'SFProDisplay',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
          ) 
        )
      ),

      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text('Source', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Sell (Rp)', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Buy (Rp)', style: TextStyle(color: Colors.white))),
              ],
              rows: _goldData.map((gold) => DataRow(cells: [
                DataCell(Row(children: [
                  Image.asset(
                    "assets/images/antam-logo.png",
                    width: 80,
                  )
                ],)),
                DataCell(Text('${gold['sell']}', style: const TextStyle(color: Colors.amber))),
                DataCell(Text('${gold['buy']}', style: const TextStyle(color: Colors.amber))),
              ])).toList() + [
                DataRow(cells: [
                  DataCell(Row(children: [
                  Image.asset(
                    "assets/images/antam-logo.png",
                    width: 80,
                  )
                ],)),
                DataCell(Text('${_goldData[0]['sell']}', style: const TextStyle(color: Colors.amber))),
                DataCell(Text('${_goldData[0]['buy']}', style: const TextStyle(color: Colors.amber))),
                ]),
                DataRow(cells: [
                  DataCell(Row(children: [
                  Image.asset(
                    "assets/images/antam-logo.png",
                    width: 80,
                  )
                ],)),
                DataCell(Text('${_goldData[0]['sell']}', style: const TextStyle(color: Colors.amber))),
                DataCell(Text('${_goldData[0]['buy']}', style: const TextStyle(color: Colors.amber))),
                ]),
                DataRow(cells: [
                  DataCell(Row(children: [
                  Image.asset(
                    "assets/images/antam-logo.png",
                    width: 80,
                  )
                ],)),
                DataCell(Text('${_goldData[0]['sell']}', style: const TextStyle(color: Colors.amber))),
                DataCell(Text('${_goldData[0]['buy']}', style: const TextStyle(color: Colors.amber))),
                ]),
              ],
            ),
          ],
        ),
      ),

        ]
      );
  }
}
