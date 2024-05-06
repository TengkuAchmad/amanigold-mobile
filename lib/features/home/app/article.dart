import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/features/home/data/article_data.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArticleState createState() => _ArticleState();
}
class _ArticleState extends State<Article> with SingleTickerProviderStateMixin{
  List<Map<String, dynamic>>_articleData = [];

  int _currentImageIndex = 0;

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
    }
  }

@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Column(
    children: [
      CarouselSlider(
        items: _articleData.map((content) {
          return Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06, vertical: screenWidth * 0.01),
            child: 
            Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: 
                Image.network(
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
                
              ) 
            ),
          );
        }).toList(),

        options: CarouselOptions(
          height: screenHeight * 0.23,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 9 / 16,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
          onPageChanged: (index, reason){
            setState(() {
              _currentImageIndex = index;
            });
          },
          
        ),
      ),

      const SizedBox(height: 2),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _articleData.map((content) {
          int index = _articleData.indexOf(content);
          return Container(
            width: 6.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentImageIndex == index ? Colors.white : Colors.grey,
            ),
          );
        }).toList(),
      ),

    ],
  );
}

}
