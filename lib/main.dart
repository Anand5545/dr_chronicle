import 'package:dr_chronicle/controller/bottom_navctrl.dart';
import 'package:dr_chronicle/controller/category_navctrl.dart';
import 'package:dr_chronicle/controller/home_screenctrl.dart';
import 'package:dr_chronicle/controller/search_screenctrl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchscreenController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainPage(),
      ),
    );
  }
}
