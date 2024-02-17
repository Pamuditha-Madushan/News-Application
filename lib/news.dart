// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:news/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d095705e15a84e2bb95f183d1d221b49";

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
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=d095705e15a84e2bb95f183d1d221b49";

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
          news.add(articleModel);
        }
      });
    }
  }
}
