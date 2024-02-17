// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_collection_literals, unused_field, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news/data.dart';
import 'package:news/model/article_model.dart';
import 'package:news/model/categoryModel.dart';
import 'package:news/news.dart';
import 'package:news/screens/article_view.dart';
import 'package:news/screens/category_news.dart';
import 'package:news/searchtest/home.dart';
import 'package:news/testing/model/articleModel.dart';
import 'package:http/http.dart' as http;
import 'package:news/widget/changeTheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<List<Article>> documents;

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  List<Map<String, dynamic>> _foundNews = [];

  bool _loading = true;

  var allNews;
  @override
  void initState() {
    _foundNews = articles.cast<Map<String, dynamic>>();
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  // void _runFilter(String enteredKeyword){
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty){
  //     results = articles.cast<Map<String, dynamic>>();
  //   }else{
  //           results = articles
  //         .where((user) =>
  //         user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }
  // }

  Future refresh() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-11-14&sortBy=publishedAt&apiKey=d095705e15a84e2bb95f183d1d221b49";

    final response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'] as String?,
            title: element['title'] as String?,
            description: element['description'] as String?,
            url: element['url'] as String?,
            urlToImage: element['urlToImage'] as String?,
            content: element['content'] as String?,
          );
          setState(() {
            articles.add(articleModel);
          });
        }
      });
    }
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage2(),
              ),
            );
          },
        ),
        title: const Text(
          "Zee-News",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: const [
          ChangeThemeButton(),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          author: articles[index].author!,
                          title: articles[index].title!,
                          description: articles[index].description!,
                          imageUrl: articles[index].urlToImage!,
                          url: articles[index].url!,
                        );
                      },
                      itemCount: articles.length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  late final String imageUrl, categoryName;
  CategoryTile({super.key, required this.imageUrl, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  late final String imageUrl;
  late final String title;
  late final String description;
  late final String url;
  late final String author;
  BlogTile(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.url,
      required this.author});

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
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  author,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ),
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
