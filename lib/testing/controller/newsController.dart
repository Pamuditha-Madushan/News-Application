// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_string_interpolations, unused_local_variable, prefer_typing_uninitialized_variables, avoid_print, constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:news/testing/interceptor/interceptor.dart';
import 'package:news/testing/model/articleModel.dart';

Future<List<Article>> Department_Tabs() async {
  const Department_Variable =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-11-14&sortBy=publishedAt&apiKey=d095705e15a84e2bb95f183d1d221b49";
  try {
    final http = InterceptedHttp.build(interceptors: [
      InsituteApiInterceptor(),
    ]);
    final response = await http.get("$Department_Variable".toUri());
    if (response.statusCode == 200) {
      final responseMap = jsonDecode(response.body);

      List<dynamic> jsonResponse = json.decode(response.body)['articles'];
      print(jsonResponse);
      return jsonResponse.map((job) => Article.fromJson(job)).toList();
    } else {
      return Future.error(
        "Error while fetching.",
        StackTrace.fromString("${response.body}"),
      );
    }
  } on SocketException {
    return Future.error('No Internet connection 😑');
  } on FormatException {
    return Future.error('Bad response format 👎');
  } on Exception {
    return Future.error('Unexpected error 😢');
  }
}
