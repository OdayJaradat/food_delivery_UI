import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';
import 'package:food_delivery/pages/food_details_page.dart';
// ignore: unused_import
import 'package:food_delivery/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodak - Food Delivery APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        fontFamily: 'OpenSans',
      ),
      routes: {
        '/': (context) => const BottomNavbarPage(),
        FoodDetailsPage.routeName: (context) => const FoodDetailsPage(),
      },
    );
  }
}
