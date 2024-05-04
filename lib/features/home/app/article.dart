import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:logger/logger.dart';
import 'package:myapp/features/home/data/article_data.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArticleState createState() => _ArticleState();
}
class _ArticleState extends State<Article> {
  List<Map<String, dynamic>>_articleData = [];
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    _loadContentData();
  }

  Future<void> _loadContentData() async {
    List<Map<String, dynamic>>? articleData = await ArticleData().getArticlePrefs(context);
    if (articleData != null) {
      setState(() {
       _articleData = articleData;
      });
      logger.i(_articleData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      items: _articleData.map((content) {
        return Container(
          padding: const EdgeInsets.all(4),
          width: screenWidth * 0.8,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.black],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Image.network(
            content['Url_CD'] ?? '',
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null){
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ?
                  loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            },
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       content['Title_CD'] ?? '', // Tampilkan judul dari data
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //     const SizedBox(height: 10),
          //     Text(
          //       content['Description_CD'] ?? '', // Tampilkan deskripsi dari data
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //     // Tambahkan widget lain sesuai kebutuhan
          //   ],
          // ),
      );
      }).toList(),
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
    );
  }
}
