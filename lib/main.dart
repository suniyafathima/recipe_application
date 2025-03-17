import 'package:flutter/material.dart';
import 'package:recipe_application/home_screen1.dart';
import 'package:recipe_application/view/List_screen/list_screen.dart';
import 'package:recipe_application/view/favorites_screen/favorite_screen.dart';
import 'package:recipe_application/view/splash_screen/splash_screen.dart';
import 'package:recipe_application/view/welcome_screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
 
//home: RecipeDetails(),
 //home: SettingsScreen(),
 //home: HomeScreen1(),
   //home:  SearchResults(),
   //home:ListScreen()
    );
  }
}
