import 'package:flutter/material.dart';
import 'package:myapp/features/splashscreen/view/splash_screen.dart';
import 'package:myapp/global/layouts/main_layout.dart';
import 'package:myapp/global/provider/checker.dart';

class DataService extends StatefulWidget {
  const DataService({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DataServiceState createState() => _DataServiceState();
}

class _DataServiceState extends State<DataService> {
  late Future<bool> _dataValidatorFuture;

  @override
  void initState() {
    super.initState();
    _dataValidatorFuture = DataController().dataValidator(context);
  }

  Future<void> _refreshData() async {
    // Lakukan pembaruan data di sini
    setState(() {
      _dataValidatorFuture = DataController().dataValidator(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        // Fungsi yang akan dipanggil saat melakukan refresh
        onRefresh: _refreshData,
        child: Center(
          child: FutureBuilder<bool>(
            future: _dataValidatorFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  backgroundColor: Colors.black,
                );
              } else {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: snapshot.data == true ? const MainLayout() : const SplashScreen(),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
