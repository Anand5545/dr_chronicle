import 'dart:convert';
import 'package:dr_chronicle/model/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchscreenController extends ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&from=2024-02-06&sortBy=popularity&apiKey=040c8cbf72524a3da72b8d7f0ce35e46");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
        },
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api failed");
      }
    } catch (e) {
      print("error : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
