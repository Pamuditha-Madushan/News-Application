// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/model/article_model.dart';
import 'package:news/news.dart';
import 'package:news/screens/article_view.dart';

class CategoryNews extends StatefulWidget {
  late final String category;
  CategoryNews({super.key, required this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    geCategorytNews();
  }

  geCategorytNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zee-News",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlogTile(
                  title: articles[index].title!,
                  description: articles[index].description!,
                  imageUrl: articles[index].urlToImage!,
                  url: articles[index].url!,
                );
              },
              itemCount: articles.length,
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  late final String imageUrl;
  late final String title;
  late final String description;
  late final String url;
  BlogTile(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // const ListTile(
            //   leading: CircleAvatar(
            //     radius: 20,
            //     backgroundColor: Colors.grey,
            //   ),
            //   title: Text(
            //     'The Enchanted Nightingale',
            //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            //   ),
            //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Source: ",
                //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                //   ),
                // ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(imageUrl))
              ],
            ),
            const SizedBox(
              height: 8,
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //       child: const Text('BUY TICKETS'),
            //       onPressed: () {/* ... */},
            //     ),
            //     const SizedBox(width: 8),
            //     TextButton(
            //       child: const Text('LISTEN'),
            //       onPressed: () {/* ... */},
            //     ),
            //     const SizedBox(width: 8),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
