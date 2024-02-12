import 'dart:convert';
import 'package:dr_chronicle/model/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Screen",
    "Sports",
    "Technology"
  ];

  String category = "business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;

  void fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=040c8cbf72524a3da72b8d7f0ce35e46");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
