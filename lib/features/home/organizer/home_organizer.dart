import 'package:flutter/material.dart';
import 'package:myapp/features/home/api/article_request.dart';
import 'package:myapp/features/home/view/home_screen.dart';
import 'package:myapp/features/home/view/loading_screen.dart';

class HomeOrganizer extends StatelessWidget {
  const HomeOrganizer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ArticleReq().articleRequest(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text('Error : ${snapshot.error}'),
            ),
          );
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}