// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => new _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController editingController = TextEditingController();
//   List<ArticleModel> articles = <ArticleModel>[];
// //final dup = List<String>.articles.;
// // List articlese = <articles>[];
//   final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//   var items = <String>[];

// @override
// void initState() {
//   items.addAll(duplicateItems);
//   super.initState();
// }

// void filterSearchResults(String query) {
//   List<String> dummySearchList = <String>[];
//   dummySearchList.addAll(duplicateItems);
//   if (query.isNotEmpty) {
//     List<String> dummyListData = <String>[];
//     dummySearchList.forEach((item) {
//       if (item.contains(query)) {
//         dummyListData.add(item);
//       }
//     });
//     setState(() {
//       items.clear();
//       items.addAll(dummyListData);
//     });
//     return;
//   } else {
//     setState(() {
//       items.clear();
//       items.addAll(duplicateItems);
//     });
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
//                 child: TextField(
//                   controller: editingController,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: "Search",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.blue))),
//                   onChanged: (value) {
//                     filterSearchResults(value);
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   onChanged: (value) {
//                     filterSearchResults(value);
//                   },
//                   controller: editingController,
//                   decoration: InputDecoration(
//                       labelText: "Search",
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(25.0)))),
//                 ),
//               ),
//               Expanded(
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: articles.length,
//                       itemBuilder: (context, index) {
//                         final article = articles[index];
//                         return ListTile(
//                           leading: Image.network(
//                             article.urlToImage.toString(),
//                             fit: BoxFit.cover,
//                             width: 50,
//                             height: 50,
//                           ),
//                           title: Text(article.title.toString()),
//                         );
//                       })),
//               // Expanded(
//               //   child: ListView.builder(
//               //     shrinkWrap: true,
//               //     itemCount: items.length,
//               //     itemBuilder: (context, index) {
//               //       return ListTile(
//               //         title: Text('${items[index]}'),
//               //       );
//               //     },
//               //   ),
//               // ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_collection_literals, prefer_const_constructors_in_immutables, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/data.dart';
import 'package:news/model/article_model.dart';
import 'package:news/model/categoryModel.dart';
import 'package:news/news.dart';
import 'package:news/screens/article_view.dart';
import 'package:news/screens/category_news.dart';
import 'package:news/testing/model/articleModel.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

late Future<List<Article>> documents;

class _SearchScreenState extends State<SearchScreen> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  TextEditingController editingController = TextEditingController();
  var items = <String>[];

  var allNews;
  @override
  void initState() {
    //items.addAll(articles);
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {});
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
        title: const Text(
          "Zee-News",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blue))),
              // onChanged: (value) {
              //   filterSearchResults(value);
              // },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextField(
          //     // onChanged: (value) {
          //     //   filterSearchResults(value);
          //     // },
          //     controller: editingController,
          //     decoration: InputDecoration(
          //         labelText: "Search",
          //         hintText: "Search",
          //         prefixIcon: Icon(Icons.search),
          //         border: OutlineInputBorder(
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(25.0)))),
          //   ),
          // ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return ListTile(
                      leading: Image.network(
                        article.urlToImage.toString(),
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(article.title.toString()),
                    );
                  })),
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: items.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text('${items[index]}'),
          //       );
          //     },
          //   ),
          // ),

          //   Container(
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          //     height: 70,
          //     child: ListView.builder(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) {
          //         return CategoryTile(
          //           imageUrl: categories[index].imageUrl,
          //           categoryName: categories[index].categoryName,
          //         );
          //       },
          //       itemCount: categories.length,
          //     ),
          //   ),
          //   Expanded(
          //     child: RefreshIndicator(
          //       onRefresh: refresh,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           return BlogTile(
          //             author: articles[index].author!,
          //             title: articles[index].title!,
          //             description: articles[index].description!,
          //             imageUrl: articles[index].urlToImage!,
          //             url: articles[index].url!,
          //           );
          //         },
          //         itemCount: articles.length,
          //       ),
          //     ),
          //   ),
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
