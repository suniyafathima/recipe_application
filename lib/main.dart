import 'package:flutter/material.dart';
//import 'package:recipe_application/view/bottom_navbar/bottom_navbar.dart';
import 'package:recipe_application/view/recipe_details/recipe_details.dart';
//import 'package:recipe_application/dummy.dart';
//import 'package:recipe_application/view/welcome_screen/welcome_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  // home:WelcomeScreen(),
  //  home:Dummy()
home: RecipeDetails(),
  //home: BottomNavbar(),
    
    );
  }
}
