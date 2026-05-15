import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account_page.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int selectedIndex = 0;
  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = const [
    HomePage(),
    FavoritePage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar;
    if (Platform.isAndroid) {
      appBar = AppBar(
        centerTitle: true,
        title: Text("Foodak", style: TextStyle(fontWeight: FontWeight.w800)),
        elevation: 0,
        backgroundColor: Colors.grey[200],
      );
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(
          middle: Text("Foodak", style: TextStyle(fontWeight: FontWeight.w800)),
          backgroundColor: Colors.grey[200]);
    } else {
      appBar = AppBar();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar,
        drawer: Drawer(
          child: const Center(
            child: Text("in Drawer"),
          ),
        ),
        body: bodyOptions[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.deepOrange,
        ),
      ),
    );
  }
}
