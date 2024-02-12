import 'package:dr_chronicle/view/Home/home_screen.dart';
import 'package:dr_chronicle/view/category_screen.dart';
import 'package:dr_chronicle/view/search/search_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [HomeScreen(), CAtegoryScreen(), SearchScreen()];
}
