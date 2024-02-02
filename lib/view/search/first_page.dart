import 'package:dr_chronicle/controller/bottom_navctrl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: BottomNavigationBar(
            currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
            onTap: Provider.of<BottomNavController>(context, listen: false).onItemtap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: "Catogory"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
            ],
            backgroundColor: Colors.black54,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            showSelectedLabels: true,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}