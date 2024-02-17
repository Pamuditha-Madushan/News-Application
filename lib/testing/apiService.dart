// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:news/testing/articleModel.dart';

// class ApiService {

//   final endPointUrl =
//       "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey={ADD YOUR API KEY HERE}";

//   Future<List<Article>> getArticle() async {
//     Response res = await get(Uri.parse(endPointUrl));

//     if (res.statusCode == 200) {
//       Map<String, dynamic> json = jsonDecode(res.body);

//       List<dynamic> body = json['articles'];

//       //this line will allow us to get the different articles from the json file and putting them into a list
//       List<Article> articles =
//           body.map((dynamic item) => Article.fromJson(item)).toList();

//       return articles;
//     } else {
//       throw ("Can't get the Articles");
//     }
//   }
// }

// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_string_interpolations, unused_local_variable, prefer_typing_uninitialized_variables, avoid_print
