import 'dart:convert';
import 'package:dr_chronicle/model/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class HomeScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;
  //var baseUrl = "https://newsapi.org/";

  fetchData() async {
    isLoading = true;
    notifyListeners();
    print("a");
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=040c8cbf72524a3da72b8d7f0ce35e46");
    print("i");
    final response = await http.get(url);

    print(response.statusCode);

    print("b");

    Map<String, dynamic> decodedData = {}; // map for storing response body
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }

  ///to share news
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
}
